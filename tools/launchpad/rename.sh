#!/bin/bash
for file in *; do
  if [[ $file == *chatgpt_demo_sdkconfig.ci* ]]; then
    version=$(grep -E "#define CHATGPT_DEMO_VERSION_(MAJOR|MINOR|PATCH)" $@/examples/chatgpt_demo/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

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
  elif [[ $file == *factory_demo_sdkconfig.ci* ]]; then
    version=$(grep -E "#define BOX_DEMO_VERSION_(MAJOR|MINOR|PATCH)" $@/examples/factory_demo/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

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
  elif [[ $file == *usb_headset_sdkconfig.ci* ]]; then
    version=$(grep -E "#define USB_HEADSET_VERSION_(MAJOR|MINOR|PATCH)" $@/examples/usb_headset/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

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
  elif [[ $file == *usb_camera_lcd_display_sdkconfig.ci* ]]; then
    version=$(grep -E "#define USB_CAMERA_VERSION_(MAJOR|MINOR|PATCH)" $@/examples/usb_camera_lcd_display/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

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
  elif [[ $file == *matter_switch_sdkconfig.ci* ]]; then
    version=$(grep -E "#define MATTER_SWITCH_VERSION_(MAJOR|MINOR|PATCH)" $@/examples/matter_switch/main/app_main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

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
  elif [[ $file == *image_display_sdkconfig.ci* ]]; then
    version=$(grep -E "#define IMAGE_DISPLAY_VERSION_(MAJOR|MINOR|PATCH)" $@/examples/image_display/main/image_display.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

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
  elif [[ $file == *lv_demos_sdkconfig.ci* ]]; then
    version=$(grep -E "#define LV_DEMO_VERSION_(MAJOR|MINOR|PATCH)" $@/examples/lv_demos/main/lv_demos.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

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
  elif [[ $file == *mp3_demo_sdkconfig.ci* ]]; then
    version=$(grep -E "#define MP3_DEMO_VERSION_(MAJOR|MINOR|PATCH)" $@/examples/mp3_demo/main/mp3_demo.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

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
  elif [[ $file == *watering_demo_sdkconfig.ci* ]]; then
    version=$(grep -E "#define WATERING_DEMO_VERSION_(MAJOR|MINOR|PATCH)" $@/examples/watering_demo/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

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