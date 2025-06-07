#!/bin/bash
# ------------------------------------------------------------------------------
# Script Name: nautilus.sh
# Description: 
#   Simulates traditional maritime ship bell timekeeping using WAV sound files.
#   Plays a bell sound at every half-hour interval following the historic 
#   4-hour watch cycle (1 to 8 bells).
#
#   Sound files must be located in the same directory as this script and named
#   according to bell count: 1.wav, 2.wav, ..., 2-2-2-2.wav
#
# Requirements:
#   - bash
#   - aplay (ALSA-utils)
#
# Usage:
#   chmod +x nautilus.sh
#   ./nautilus.sh
#   Press Q to quit.
#
# Author: Thomas L.C. van Houten
# Date: 2025-06-07
# ------------------------------------------------------------------------------

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
SOUND_PATH="$SCRIPT_DIR"

declare -A bell_times=(
        ["1.wav"]       ="00:30:00 04:30:00 08:30:00 12:30:00 16:30:00 20:30:00"
        ["2.wav"]       ="01:00:00 05:00:00 09:00:00 13:00:00 17:00:00 21:00:00"
        ["2-1.wav"]     ="01:30:00 05:30:00 09:30:00 13:30:00 17:30:00 21:30:00"
        ["2-2.wav"]     ="02:00:00 06:00:00 10:00:00 14:00:00 18:00:00 22:00:00"
        ["2-2-1.wav"]   ="02:30:00 06:30:00 10:30:00 14:30:00 18:30:00 22:30:00"
        ["2-2-2.wav"]   ="03:00:00 07:00:00 11:00:00 15:00:00 19:00:00 23:00:00"
        ["2-2-2-1.wav"] ="03:30:00 07:30:00 11:30:00 15:30:00 19:30:00 23:30:00"
        ["2-2-2-2.wav"] ="00:00:00 04:00:00 08:00:00 12:00:00 16:00:00 20:00:00"
)

echo Press Q to exit.

while true; do
    now=$(date +%T)
    tput sc
    echo -en "$now"
    tput rc

    for file in "${!bell_times[@]}"; do
        if [[ "${bell_times[$file]}" =~ (^|[[:space:]])"$now"($|[[:space:]]) ]]; then
            aplay "$SOUND_PATH/$file" &>/dev/null &
            sleep 1
            break
        fi
    done

    read -t 0.25 -N 1 input
    if [[ $input = [Qq] ]]; then
        echo
        break
    fi
done