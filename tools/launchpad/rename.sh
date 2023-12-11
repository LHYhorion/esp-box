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
  elif [[ $file == *usb_camera_sdkconfig.ci* ]]; then
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
  fi
done