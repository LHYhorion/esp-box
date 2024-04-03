/* BSD Socket API Example

   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include <string.h>
#include <sys/param.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "esp_system.h"
#include "esp_event.h"
#include "esp_log.h"
#include "nvs_flash.h"
#include "esp_netif.h"

#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include <lwip/netdb.h>

#include "app_udp_client.h"
#include "app_wifi.h"


#define HOST_IP_ADDR "192.168.1.141/"
#define PORT         3333

static const char *TAG = "tcp_client";
//static const char *payload = "Message from ESP32 ";

extern bool ir_learning_done;

static void udp_client_task(void *pvParameters)
{
    char rx_buffer[128];
    char host_ip[] = HOST_IP_ADDR;
    int addr_family = 0;
    int ip_protocol = 0;

    while (1) {
        
        while(!app_wifi_is_connected()) {
            vTaskDelay(1000 / portTICK_PERIOD_MS);
        }

        struct sockaddr_in dest_addr;
        dest_addr.sin_addr.s_addr = inet_addr(HOST_IP_ADDR);
        dest_addr.sin_family = AF_INET;
        dest_addr.sin_port = htons(PORT);
        addr_family = AF_INET;
        ip_protocol = IPPROTO_IP;

        int sock = socket(addr_family, SOCK_DGRAM, ip_protocol);
        if (sock < 0) {
            ESP_LOGE(TAG, "Unable to create socket: errno %d", errno);
            break;
        }

        // Set timeout
        struct timeval timeout;
        timeout.tv_sec = 10;
        timeout.tv_usec = 0;
        setsockopt (sock, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof timeout);

        ESP_LOGI(TAG, "Socket created, sending to %s:%d", HOST_IP_ADDR, PORT);

        while (1) {
            if(ir_learning_done) {
                FILE *fp = NULL;
                char *ir_file = (char*)heap_caps_calloc(1, 48, MALLOC_CAP_SPIRAM);
                strncpy(ir_file, "/spiffs/my_learn_off.cfg", 48);
                fp = fopen(ir_file, "r");
                if(fp == NULL) {
                    ESP_LOGE(TAG, "Failed to open file for reading");
                    break;
                }
                uint8_t *ir_buffer = (uint8_t*)heap_caps_calloc(1, 1024, MALLOC_CAP_SPIRAM);
                size_t ir_size = fread(ir_buffer, 1, 1024, fp);
                if(ir_size != 0) {
                    int err = sendto(sock, ir_buffer, 1024, 0, (struct sockaddr *)&dest_addr, sizeof(dest_addr));
                    if (err < 0) {
                        ESP_LOGE(TAG, "Error occurred during sending: errno %d", errno);
                        break;
                    } else {
                        ESP_LOGW(TAG, "IR Buffer done");
                    }
                    ir_learning_done = false;
                }
                fclose(fp);
            }
            // struct sockaddr_storage source_addr; // Large enough for both IPv4 or IPv6
            // socklen_t socklen = sizeof(source_addr);
            // int len = recvfrom(sock, rx_buffer, sizeof(rx_buffer) - 1, 0, (struct sockaddr *)&source_addr, &socklen);

            // // Error occurred during receiving
            // if (len < 0) {
            //     ESP_LOGE(TAG, "recvfrom failed: errno %d", errno);
            //     break;
            // }
            // // Data received
            // else {
            //     rx_buffer[len] = 0; // Null-terminate whatever we received and treat like a string
            //     ESP_LOGI(TAG, "Received %d bytes from %s:", len, host_ip);
            //     ESP_LOGI(TAG, "%s", rx_buffer);
            //     if (strncmp(rx_buffer, "OK: ", 4) == 0) {
            //         ESP_LOGI(TAG, "Received expected message, reconnecting");
            //         break;
            //     }
            // }

            vTaskDelay(2000 / portTICK_PERIOD_MS);
        }

        if (sock != -1) {
            ESP_LOGE(TAG, "Shutting down socket and restarting...");
            shutdown(sock, 0);
            close(sock);
        }
    }
    vTaskDelete(NULL);
}

void app_udp_client_init(void)
{
    xTaskCreate(udp_client_task, "udp_client", 4096, NULL, 5, NULL);
}
