#!/bin/bash

docker-compose down
docker-compose up -d --force-recreate --remove-orphans