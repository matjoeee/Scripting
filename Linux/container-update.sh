#!/bin/sh
####################################
#
# Script to update all running containers
#
####################################

# Pull all images
sudo docker-compose pull

# Restart all
sudo docker-compose up -d