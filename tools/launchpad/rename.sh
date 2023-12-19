#!/bin/bash

version_with_dots() {
  version=$(grep -E "#define \$1_(MAJOR|MINOR|PATCH)" $@/examples/\$2/main/\$3 | awk '{print \$3}')
  version="${version//[\t\r\n ']/}"
  echo $(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')
}

rename_file() {
  case "$file" in
    *_sdkconfig.ci.box-3*)
      echo $(echo "$file" | sed "s/_sdkconfig.ci.box-3/-ESP-BOX-3-\$1/g")
      ;;
    *_sdkconfig.ci.box-lite*)
      echo $(echo "$file" | sed "s/_sdkconfig.ci.box-lite/-ESP-BOX-Lite-\$1/g")
      ;;
    *_sdkconfig.ci.box*)
      echo $(echo "$file" | sed "s/_sdkconfig.ci.box/-ESP-BOX-\$1/g")
      ;;
    *)
      echo "$file"
      ;;
  esac
}

for file in *; do
  if [[ $file == *sdkconfig.ci* ]]; then
    case "$file" in
      *chatgpt_demo_sdkconfig.ci*)
        version=$(version_with_dots "CHATGPT_DEMO_VERSION" "chatgpt_demo" "main.h")
        ;;
      *factory_demo_sdkconfig.ci*)
        version=$(version_with_dots "BOX_DEMO_VERSION" "factory_demo" "main.h")
        ;;
      *usb_headset_sdkconfig.ci*)
        version=$(version_with_dots "USB_HEADSET_VERSION" "usb_headset" "main.h")
        ;;
      *usb_camera_lcd_display_sdkconfig.ci*)
        version=$(version_with_dots "USB_CAMERA_VERSION" "usb_camera_lcd_display" "main.h")
        ;;
      *matter_switch_sdkconfig.ci*)
        version=$(version_with_dots "MATTER_SWITCH_VERSION" "matter_switch" "app_main.h")
        ;;
      *image_display_sdkconfig.ci*)
        version=$(version_with_dots "IMAGE_DISPLAY_VERSION" "image_display" "image_display.h")
        ;;
      *lv_demos_sdkconfig.ci*)
        version=$(version_with_dots "LV_DEMO_VERSION" "lv_demos" "lv_demos.h")
        ;;
      *mp3_demo_sdkconfig.ci*)
        version=$(version_with_dots "MP3_DEMO_VERSION" "mp3_demo" "mp3_demo.h")
        ;;
      *watering_demo_sdkconfig.ci*)
        version=$(version_with_dots "WATERING_DEMO_VERSION" "watering_demo" "main.h")
        ;;
      *)
        version=""
        ;;
    esac

    if [[ ! -z "$version" ]]; then
      newfile=$(rename_file "$version")
      mv "$file" "$newfile"
    fi
  fi
done
