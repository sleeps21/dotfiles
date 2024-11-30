#!/bin/bash

killall waybar

sass $HOME/.config/waybar/style.scss $HOME/.config/waybar/style.css

waybar
