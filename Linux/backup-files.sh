#!/bin/sh
####################################
#
# Backup files to specified folder
# Files will be backed up as .tar.gz
#
####################################

# What to backup.
backup_files="name"

# Specify which directory to backup to.
dest="/path/to/backups"

# Create backup archive filename.
day=$(date +%A)    # Displays name of day
# day=$(date +%Y%m%D)   # Displays current date YYYYmmDD
archive_file="$day-$backup_files.tar.gz"

# Backup the files using tar.
cd /path/to/destintation && tar zcvf $dest/$archive_file $backup_files