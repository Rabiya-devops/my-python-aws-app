#!/bin/bash
# Stop all containers for this app
CONTAINER_ID=$(docker ps -aq --filter "ancestor=my-python-app:latest")

if [ ! -z "$CONTAINER_ID" ]; then
    echo "Stopping container $CONTAINER_ID"
    docker stop $CONTAINER_ID
    docker rm $CONTAINER_ID
else
    echo "No running container to stop."
fi