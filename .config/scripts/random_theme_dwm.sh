#!/bin/bash

directory=$HOME/wallpaper

if [ -d "$directory" ]; then
    random_background=$(ls $directory/*.{jpg,png} | shuf -n 1)
fi

$HOME/.config/scripts/change_theme_dwm.sh $random_background

