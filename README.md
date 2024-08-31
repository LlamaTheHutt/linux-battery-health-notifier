### Battery Status Notification Script ⚡🔋

Monitors battery status and sends notifications:

- **Charging ⚡:** Alerts to unplug when over 80%.
- **Discharging 🔋:** Reminds to plug in when under 20%.
- **Status Reporting 🗨️:** Provides updates on battery state.

**Usage:**

- **Setup:** Schedule with `crontab` for automatic updates.
- Make executable (`chmod +x script.sh`) and configure cron job.

**Requirements:**

- Linux with `notify-send`.
- Access to `/sys/class/power_supply/BAT0/`.

Keep track of your battery status and avoid overcharging or running low.
