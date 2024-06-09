#!/bin/sh
####################################
#
# Backup all backups to off-site
# aws S3 bucket.
#
####################################

aws s3 cp /path/to/backups/backup-file.tar.gz s3://bucket-name