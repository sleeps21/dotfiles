#!/bin/bash


directory=$HOME/wallpaper
monitors=$(hyprctl monitors | grep Monitor | awk '{print $2}')
echo "$monitor"

if [ -d "$directory" ]; then
    random_background=$(ls $directory/*.{jpg,png} | shuf -n 1)
fi

$HOME/.config/scripts/change_themes.sh $random_background

