#!/bin/bash
for file in *; do
  if [[ $file == *chatgpt_demo_sdkconfig.ci.box-3* ]]; then
    version=$(grep -E "#define CHATGPT_DEMO_VERSION_(MAJOR|MINOR|PATCH)" $var/examples/chatgpt_demo/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box-3/-ESP-BOX-3-$version_with_dots/g")

    mv "$file" "$newfile"

  elif [[ $file == *chatgpt_demo_sdkconfig.ci.box-lite* ]]; then
    version=$(grep -E "#define CHATGPT_DEMO_VERSION_(MAJOR|MINOR|PATCH)" $var/examples/chatgpt_demo/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box-lite/-ESP-BOX-Lite-$version_with_dots/g")

    mv "$file" "$newfile"

  elif [[ $file == *chatgpt_demo_sdkconfig.ci.box* ]]; then
    version=$(grep -E "#define CHATGPT_DEMO_VERSION_(MAJOR|MINOR|PATCH)" $var
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box/-ESP-BOX-$version_with_dots/g")

    mv "$file" "$newfile"

  elif [[ $file == *factory_demo_sdkconfig.ci.box-3* ]]; then
    version=$(grep -E "#define BOX_DEMO_VERSION_(MAJOR|MINOR|PATCH)" $var/examples/factory_demo/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box-3/-ESP-BOX-3-$version_with_dots/g")

    mv "$file" "$newfile"

  elif [[ $file == *factory_demo_sdkconfig.ci.box-lite* ]]; then
    version=$(grep -E "#define BOX_DEMO_VERSION_(MAJOR|MINOR|PATCH)" $var/examples/factory_demo/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box-lite/-ESP-BOX-Lite-$version_with_dots/g")

    mv "$file" "$newfile"

  elif [[ $file == *factory_demo_sdkconfig.ci.box* ]]; then
    version=$(grep -E "#define BOX_DEMO_VERSION_(MAJOR|MINOR|PATCH)" $var/examples/factory_demo/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box/-ESP-BOX-$version_with_dots/g")

    mv "$file" "$newfile"
  elif [[ $file == *usb_headset_sdkconfig.ci.box-3* ]]; then
    version=$(grep -E "#define USB_HEADSET_VERSION_(MAJOR|MINOR|PATCH)" $var/examples/usb_headset/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box-3/-ESP-BOX-3-$version_with_dots/g")

    mv "$file" "$newfile"

  elif [[ $file == *usb_headset_sdkconfig.ci.box-lite* ]]; then
    version=$(grep -E "#define USB_HEADSET_VERSION_(MAJOR|MINOR|PATCH)" $var/examples/usb_headset/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box-lite/-ESP-BOX-Lite-$version_with_dots/g")

    mv "$file" "$newfile"

  elif [[ $file == *usb_headset_sdkconfig.ci.box* ]]; then
    version=$(grep -E "#define USB_HEADSET_VERSION_(MAJOR|MINOR|PATCH)" $var/examples/usb_headset/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box/-ESP-BOX-$version_with_dots/g")

    mv "$file" "$newfile"
  elif [[ $file == *usb_camera_sdkconfig.ci.box-3* ]]; then
    version=$(grep -E "#define USB_CAMERA_VERSION_(MAJOR|MINOR|PATCH)" $var/examples/usb_camera_lcd_display/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box-3/-ESP-BOX-3-$version_with_dots/g")

    mv "$file" "$newfile"

  elif [[ $file == *usb_camera_sdkconfig.ci.box-lite* ]]; then
    version=$(grep -E "#define USB_CAMERA_VERSION_(MAJOR|MINOR|PATCH)" $var/examples/usb_camera_lcd_display/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box-lite/-ESP-BOX-Lite-$version_with_dots/g")

    mv "$file" "$newfile"

  elif [[ $file == *usb_camera_sdkconfig.ci.box* ]]; then
    version=$(grep -E "#define USB_CAMERA_VERSION_(MAJOR|MINOR|PATCH)" $var/examples/usb_camera_lcd_display/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box/-ESP-BOX-$version_with_dots/g")

    mv "$file" "$newfile"
  elif [[ $file == *matter_switch_sdkconfig.ci.box-3* ]]; then
    version=$(grep -E "#define MATTER_SWITCH_VERSION_(MAJOR|MINOR|PATCH)" $var/examples/matter_switch/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box-3/-ESP-BOX-3-$version_with_dots/g")

    mv "$file" "$newfile"

  elif [[ $file == *matter_switch_sdkconfig.ci.box-lite* ]]; then
    version=$(grep -E "#define MATTER_SWITCH_VERSION_(MAJOR|MINOR|PATCH)" $var/examples/matter_switch/main/main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box-lite/-ESP-BOX-Lite-$version_with_dots/g")

    mv "$file" "$newfile"

  elif [[ $file == *matter_switch_sdkconfig.ci.box* ]]; then
    version=$(grep -E "#define MATTER_SWITCH_VERSION_(MAJOR|MINOR|PATCH)" $var/examples/matter_switch/main/app_main.h | awk '{print $3}')
    version="${version//[$'\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1_/g' | sed 's/\_$//')

    newfile=$(echo "$file" | sed "s/_sdkconfig.ci.box/-ESP-BOX-$version_with_dots/g")

    mv "$file" "$newfile"
  fi
done
