#!/bin/bash

# Load environment variables from .env file
source .env

# Create data directory if it doesn't exist
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