/*
 * SPDX-FileCopyrightText: 2015-2022 Espressif Systems (Shanghai) CO LTD
 *
 * SPDX-License-Identifier: Unlicense OR CC0-1.0
 */

#pragma once

#include "driver/gpio.h"
#include "esp_err.h"

#ifdef __cplusplus
extern "C" {
#endif

void app_udp_client_init(void);

esp_err_t ir_learning_send_on_set(bool state);

esp_err_t ir_learning_send_off_set(bool state);

#ifdef __cplusplus
}
#endif
