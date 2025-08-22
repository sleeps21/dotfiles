#!/bin/bash
. "$HOME/.cache/hellwal/variables.sh" || exit 1
envsubst < "$HOME/.config/hellwal/templates/dunstrc" > "$HOME/.cache/hellwal/dunstrc"

