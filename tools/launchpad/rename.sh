#!/bin/bash

rename_files() {
    local file="\$1"
    local version_cmd="\$2"

    version=$(grep -E "$version_cmd" $@/examples/${file%%_*}/main/main.h | awk '{print \$3}')
    version="${version//[\t\r\n ']/}"

    version_with_dots=$(echo "$version" | sed 's/\(.\)/\1./g' | sed 's/\.$//')

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
}

for file in *; do
    case "$file" in
        *chatgpt_demo_sdkconfig.ci*)
            rename_files "$file" "#define CHATGPT_DEMO_VERSION_(MAJOR|MINOR|PATCH)"
            ;;
        *factory_demo_sdkconfig.ci*)
            rename_files "$file" "#define BOX_DEMO_VERSION_(MAJOR|MINOR|PATCH)"
            ;;
        *usb_headset_sdkconfig.ci*)
            rename_files "$file" "#define USB_HEADSET_VERSION_(MAJOR|MINOR|PATCH)"
            ;;
        *usb_camera_lcd_display_sdkconfig.ci*)
            rename_files "$file" "#define USB_CAMERA_VERSION_(MAJOR|MINOR|PATCH)"
            ;;
        *matter_switch_sdkconfig.ci*)
            rename_files "$file" "#define MATTER_SWITCH_VERSION_(MAJOR|MINOR|PATCH)"
            ;;
        *image_display_sdkconfig.ci*)
            rename_files "$file" "#define IMAGE_DISPLAY_VERSION_(MAJOR|MINOR|PATCH)"
            ;;
        *lv_demos_sdkconfig.ci*)
            rename_files "$file" "#define LV_DEMO_VERSION_(MAJOR|MINOR|PATCH)"
            ;;
        *mp3_demo_sdkconfig.ci*)
            rename_files "$file" "#define MP3_DEMO_VERSION_(MAJOR|MINOR|PATCH)"
            ;;
        *watering_demo_sdkconfig.ci*)
            rename_files "$file" "#define WATERING_DEMO_VERSION_(MAJOR|MINOR|PATCH)"
            ;;
    esac
done
