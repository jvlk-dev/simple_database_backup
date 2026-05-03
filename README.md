# Simple Database Backup Script
Simple Linux Bash database backup script for a MariaDB container

# Guide

*   **1. Make it executable**
    ```bash
    chmod +x /path/to/your_script.sh
    ```
*   **2. Open the Crontab editor**
    ```bash
    crontab -e
    ```
*   **3. Add the schedule**
    ```bash
    0 2 * * * /path/to/your_script.sh
    ```
*   **4. Save and Exit**
    ```bash
    CTRL+O, then CTRL+X
    ```
