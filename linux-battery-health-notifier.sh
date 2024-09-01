#!/usr/bin/env bash

BATTERY_PATH="/sys/class/power_supply/BAT0/status"
BATTERY_PERCENTAGE_PATH="/sys/class/power_supply/BAT0/capacity"

if [ -f "$BATTERY_PATH" ]; then
    STATUS=$(cat "$BATTERY_PATH")
    battery_percentage=$(cat "$BATTERY_PERCENTAGE_PATH")

    if [ "$STATUS" = "Charging" ]; then
        if [ "$battery_percentage" -gt 80 ]; then
            XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send "Battery Warning" "Battery is at ${battery_percentage}%. Please unplug your charger."
        else
            echo "Still Charging..."
        fi
    elif [ "$STATUS" = "Discharging" ]; then
        if [ "$battery_percentage" -lt 20 ]; then
            XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send "Battery Warning" "Battery is at ${battery_percentage}%. Please plug in your charger."
        else
            echo "Battery is discharging but above 20%."
        fi
    else
        echo "Unknown battery status: $STATUS"
    fi
else
    echo "Battery status file not found."
fi
