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

(Usually both prerequisite above are already met by default.)

**Setup:**

- `Ctrl` + `Alt` + `T` to enter the terminal.
- `crontab -e` to edit the crontab file with the editor of your choice, `nano` being the easiest.
- Crontab file instructions:
	To define the time you can provide concrete values for minute (m), hour (h), day of month (dom), month (mon), and day of week (dow) or use `*` in these fields (for 'any').
	
	Example for every five minutes:
	`*/5 * * * * /path/to/file.sh`

Keep track of your battery status and avoid overcharging or running low.
