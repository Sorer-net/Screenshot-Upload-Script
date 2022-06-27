#!/bin/bash

key="Your CloudFlare Key"
url="https://sorer.net/screenshots/" # requires a trailing slash
# url="http://localhost:8787/" # requires a trailing slash

temp_file="/tmp/screenshot.png"
flameshot gui -r >$temp_file

if [[ $(file --mime-type -b $temp_file) != "image/png" ]]; then
    rm $temp_file
    notify-send "Screenshot aborted." -a "Flameshot" && exit 1
fi

image_id=$(curl -X POST "$url" -H "Authorization: $key" -F "file=@$temp_file")
echo $image_id

if [[ "${#image_id}" -eq 36 ]]; then
    image_url="$url$image_id.png"
    echo "$image_url" | xclip -sel c
    notify-send "Image URL copied to clipboard." "$image_url" -a "Flameshot" -i $temp_file
else
    xclip-copyfile $temp_file
    notify-send "Uploading failed" "Copied image to clipboard." -a "Flameshot" -i $temp_file
fi
