#!/bin/bash

# Load environment variables from .env file
source .env

# Stop and remove existing containers
docker-compose down

# Remove existing data directory
sudo rm -rf ./data

# Create new data directory
mkdir -p ./data

# Set correct permissions
sudo chown -R $UID:$GID ./data
sudo chmod -R 755 ./data

# Export environment variables
export PUID=$UID
export PGID=$GID
export TZ="$TZ"

# Run docker-compose
docker-compose up -d --force-recreate