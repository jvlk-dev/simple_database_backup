#!/bin/bash

# --- CONFIGURATION ---
CONTAINER_NAME="mariadb"
DB_USER=""
DB_PASS=""
BACKUP_DIR="/DATA/Archive/Backups/Database"
DATE=$(date +%Y-%m-%d_%H%M)
# ---------------------

echo "Starting database backup for: $DATE"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Run the backup command inside the Docker container
# We use 'mariadb-dump' to export all databases into one .sql file
docker exec $CONTAINER_NAME /usr/bin/mariadb-dump -u $DB_USER --password=$DB_PASS --all-databases > $BACKUP_DIR/full_backup_$DATE.sql

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Success: Backup saved to $BACKUP_DIR/full_backup_$DATE.sql"

    # Optional: Compress the backup to save space (SQL files shrink a lot!)
    gzip $BACKUP_DIR/full_backup_$DATE.sql
    echo "Backup compressed: full_backup_$DATE.sql.gz"
else
    echo "ERROR: Backup failed!"
    exit 1
fi

# --- HOUSEKEEPING ---
# Delete backups older than 30 days to keep the 500GB SSD clean
find $BACKUP_DIR -type f -mtime +30 -delete
echo "Old backups cleaned up."
