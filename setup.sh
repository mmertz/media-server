#!/bin/bash

# Load environment variables from .env file
source .env

# Function to generate a random API key
generate_api_key() {
    openssl rand -hex 16
}

# Generate and export API keys if not set in .env
export SONARR_API_KEY="${SONARR_API_KEY:-$(generate_api_key)}"
export RADARR_API_KEY="${RADARR_API_KEY:-$(generate_api_key)}"
export PROWLARR_API_KEY="${PROWLARR_API_KEY:-$(generate_api_key)}"
export BAZARR_API_KEY="${BAZARR_API_KEY:-$(generate_api_key)}"

# Update .env file with generated API keys
sed -i "s/^SONARR_API_KEY=.*/SONARR_API_KEY=\"$SONARR_API_KEY\"/" .env
sed -i "s/^RADARR_API_KEY=.*/RADARR_API_KEY=\"$RADARR_API_KEY\"/" .env
sed -i "s/^PROWLARR_API_KEY=.*/PROWLARR_API_KEY=\"$PROWLARR_API_KEY\"/" .env
sed -i "s/^BAZARR_API_KEY=.*/BAZARR_API_KEY=\"$BAZARR_API_KEY\"/" .env

# Stop and remove existing containers
docker-compose down

# Remove existing data directory
sudo rm -rf ./data

# Create new data directory
mkdir -p ./data

# Set correct permissions
sudo chown -R $UID:$GID ./data
sudo chmod -R 755 ./data

# Export other environment variables
export PUID=$UID
export PGID=$GID
export TZ="$TZ"
export NZBGEEK_API_KEY="$NZBGEEK_API_KEY"

# Run docker-compose
docker-compose up -d --force-recreate

# Display generated API keys
echo "Generated API keys:"
echo "SONARR_API_KEY: $SONARR_API_KEY"
echo "RADARR_API_KEY: $RADARR_API_KEY"
echo "PROWLARR_API_KEY: $PROWLARR_API_KEY"
echo "BAZARR_API_KEY: $BAZARR_API_KEY"