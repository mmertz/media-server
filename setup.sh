#!/bin/bash

source .env
# Set environment variables
export PUID=$(id -u)
export PGID=$(id -g)
export TZ="${TZ:-UTC}"

# Restart Docker containers
docker-compose down
docker-compose up -d --force-recreate