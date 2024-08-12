#!/bin/bash

source .env

generate_api_key() {
    openssl rand -hex 16
}

export SONARR_API_KEY="${SONARR_API_KEY:-$(generate_api_key)}"
export RADARR_API_KEY="${RADARR_API_KEY:-$(generate_api_key)}"
export PROWLARR_API_KEY="${PROWLARR_API_KEY:-$(generate_api_key)}"
export BAZARR_API_KEY="${BAZARR_API_KEY:-$(generate_api_key)}"

sed -i "s/^SONARR_API_KEY=.*/SONARR_API_KEY=\"$SONARR_API_KEY\"/" .env
sed -i "s/^RADARR_API_KEY=.*/RADARR_API_KEY=\"$RADARR_API_KEY\"/" .env
sed -i "s/^PROWLARR_API_KEY=.*/PROWLARR_API_KEY=\"$PROWLARR_API_KEY\"/" .env
sed -i "s/^BAZARR_API_KEY=.*/BAZARR_API_KEY=\"$BAZARR_API_KEY\"/" .env

docker-compose down

sudo rm -rf ./data

sudo rm -rf ./data

sudo chown -R $UID:$GID ./data
sudo chmod -R 755 ./data

export PUID=$UID
export PGID=$GID
export TZ="$TZ"
export NZBGEEK_API_KEY="$NZBGEEK_API_KEY"

export SONARR_API_KEY="${SONARR_API_KEY:-$(generate_api_key)}"
export RADARR_API_KEY="${RADARR_API_KEY:-$(generate_api_key)}"
export PROWLARR_API_KEY="${PROWLARR_API_KEY:-$(generate_api_key)}"
export BAZARR_API_KEY="${BAZARR_API_KEY:-$(generate_api_key)}"

sed -i "s/^SONARR_API_KEY=.*/SONARR_API_KEY=\"$SONARR_API_KEY\"/" .env
sed -i "s/^RADARR_API_KEY=.*/RADARR_API_KEY=\"$RADARR_API_KEY\"/" .env
sed -i "s/^PROWLARR_API_KEY=.*/PROWLARR_API_KEY=\"$PROWLARR_API_KEY\"/" .env
sed -i "s/^BAZARR_API_KEY=.*/BAZARR_API_KEY=\"$BAZARR_API_KEY\"/" .env


docker-compose up -d --force-recreate
