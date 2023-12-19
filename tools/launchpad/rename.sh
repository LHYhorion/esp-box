#!/bin/bash

function rename_files() {
  local file_prefix=\$1
  local version_def=\$2
  local file_path=\$3

  for file in *; do
    if [[ $file == *${file_prefix}* ]]; then
      version=$(grep -E "#define ${version_def}_(MAJOR|MINOR|PATCH)" ${file_path} | awk '{print \$3}')
      version="${version//[\t\r\n ']/}"
      version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

      case "$file" in
        *_sdkconfig.ci.box-3*)
          newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box-3/-ESP-BOX-3-$version_with_dots/g")
          ;;
        *_sdkconfig.ci.box-lite*)
          newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box-lite/-ESP-BOX-Lite-$version_with_dots/g")
          ;;
        *_sdkconfig.ci.box*)
          newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box/-ESP-BOX-$version_with_dots/g")
          ;;
        *)
          newfile="$file"
          ;;
      esac

      mv "$file" "$newfile"
    fi
  done
}

rename_files "chatgpt_demo_sdkconfig.ci" "CHATGPT_DEMO_VERSION" "$@/examples/chatgpt_demo/main/main.h"
rename_files "factory_demo_sdkconfig.ci" "BOX_DEMO_VERSION" "$@/examples/factory_demo/main/main.h"
rename_files "usb_headset_sdkconfig.ci" "USB_HEADSET_VERSION" "$@/examples/usb_headset/main/main.h"
rename_files "usb_camera_lcd_display_sdkconfig.ci" "USB_CAMERA_VERSION" "$@/examples/usb_camera_lcd_display/main/main.h"
rename_files "matter_switch_sdkconfig.ci" "MATTER_SWITCH_VERSION" "$@/examples/matter_switch/main/app_main.h"
rename_files "image_display_sdkconfig.ci" "IMAGE_DISPLAY_VERSION" "$@/examples/image_display/main/image_display.h"
rename_files "lv_demos_sdkconfig.ci" "LV_DEMO_VERSION" "$@/examples/lv_demos/main/lv_demos.h"
rename_files "mp3_demo_sdkconfig.ci" "MP3_DEMO_VERSION" "$@/examples/mp3_demo/main/mp3_demo.h"
rename_files "watering_demo_sdkconfig.ci" "WATERING_DEMO_VERSION" "$@/examples/watering_demo/main/main.h"
