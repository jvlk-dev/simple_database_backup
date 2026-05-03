# Simple Database Backup Script
Simple Linux Bash database backup script for a MariaDB container

# Guide
1. Make it executable
chmod +x /path/to/your_script.sh

2. Open the Crontab editor
crontab -e

3. Add the schedule
0 2 * * * /path/to/your_script.sh

4. Save and Exit
CTRL+O, then CTRL+X
