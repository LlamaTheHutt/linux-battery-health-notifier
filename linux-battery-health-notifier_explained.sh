# Define the path to the file that contains the battery status
BATTERY_PATH="/sys/class/power_supply/BAT0/status"

# Define the path to the file that contains the battery percentage
BATTERY_PERCENTAGE_PATH="/sys/class/power_supply/BAT0/capacity"

# Check if the battery status file exists
if [ -f "$BATTERY_PATH" ]; then
    # Read the current battery status (e.g., Charging, Discharging)
    STATUS=$(cat "$BATTERY_PATH")
    
    # Read the current battery percentage
    battery_percentage=$(cat "$BATTERY_PERCENTAGE_PATH")

    # Check if the battery is currently charging
    if [ "$STATUS" = "Charging" ]; then
        # If the battery percentage is greater than 80%, notify the user to unplug the charger
        if [ "$battery_percentage" -gt 80 ]; then
            # Set the runtime directory for notifications and send a warning about high battery
            XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send "Battery Warning" "Battery is at ${battery_percentage}%. Please unplug your charger."
        else
            # Print a message indicating the battery is still charging but below 80%
            echo "Still Charging..."
        fi
    # Check if the battery is currently discharging
    elif [ "$STATUS" = "Discharging" ]; then
        # If the battery percentage is less than 20%, notify the user to plug in the charger
        if [ "$battery_percentage" -lt 20 ]; then
            # Set the runtime directory for notifications and send a warning about low battery
            XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send "Battery Warning" "Battery is at ${battery_percentage}%. Please plug in your charger."
        else
            # Print a message indicating the battery is discharging but above 20%
            echo "Battery is discharging but above 20%."
        fi
    else
        # Print a message if the battery status is neither Charging nor Discharging
        echo "Unknown battery status: $STATUS"
    fi
else
    # Print a message if the battery status file does not exist
    echo "Battery status file not found."
fi
