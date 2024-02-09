#!/bin/zsh

monitorAFocused=$(hyprctl monitors | grep -oP "focused: \K\w+" | head -n 1)

hyprctl dispatch swapactiveworkspaces 0 1

if [[ "$monitorAFocused" == "yes" ]]; then
    hyprctl dispatch focusmonitor 1
else
    hyprctl dispatch focusmonitor 0
fi
