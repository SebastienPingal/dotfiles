#!/bin/sh

# Usage: focus-or-launch.sh "window_class" "launch_command" ["window_title"]
# Example: focus-or-launch.sh "Google-chrome" "google-chrome-stable"
# Example with title: focus-or-launch.sh "Steam" "steam" "Steam"

window_class=$1
launch_command=$2
window_title=${3:-$1} # Use the window_title if provided, otherwise use window_class

if hyprctl clients | grep -q "class: $window_class\|title: $window_title"; then
  hyprctl dispatch focusclass "$window_class"
else
  $launch_command
fi
