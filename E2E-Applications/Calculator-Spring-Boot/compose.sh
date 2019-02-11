#!/usr/bin/env bash

set -e

# Build the project and docker images
mvn clean install -DpushImage

DOCKER_IP=${DOCKER_IP:-localhost}

# Remove existing containers
docker-compose stop
docker-compose rm -f

# Start the discovery service next and wait
docker-compose up -d discovery

while [ -z ${DISCOVERY_SERVICE_READY} ]; do
  echo "Waiting for discovery service..."
  if [ "$(curl --silent $DOCKER_IP:8761/health 2>&1 | grep -q '\"status\":\"UP\"'; echo $?)" = 0 ]; then
      DISCOVERY_SERVICE_READY=true;
  fi
  sleep 2
done

# Start the other containers
docker-compose up -d

# Attach to the log output of the cluster
docker-compose logs
