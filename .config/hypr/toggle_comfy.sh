#!/bin/bash

# Define configurations
config1="
  keyword general:gaps_in 0 ;\
  keyword general:gaps_out 0 ;\
  keyword general:border_size 2 ;\
  keyword general:col.inactive_border rgba(11111bFF) ;\
  keyword decoration:rounding 3 ;\
  keyword decoration:drop_shadow false ;\
  keyword animations:enabled 0;\
  keyword dwindle:no_gaps_when_only 1"

config2="
  keyword general:gaps_in 5 ;\
  keyword general:gaps_out 7,7,7,7 ;\
  keyword general:border_size 3 ;\
  keyword general:col.inactive_border rgba(b4befe33) ;\
  keyword decoration:rounding 15 ;\
  keyword decoration:drop_shadow true ;\
  keyword animations:enabled 1;\
  keyword dwindle:no_gaps_when_only 0"

# Get current configuration state
current_gaps_in=$(hyprctl getoption general:gaps_in | grep -oP '\d+ \d+ \d+ \d+')

# Check if the current gaps_in is all zeros
if [ "$current_gaps_in" = "0 0 0 0" ]; then
  hyprctl --batch "$config2"
else
  hyprctl --batch "$config1"
fi
