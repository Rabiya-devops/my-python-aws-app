#!/bin/bash
# Stop and remove any existing container
CONTAINER_NAME="my-python-app-container"
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

# The Docker Hub image name (replace with your Docker Hub username)
DOCKER_IMAGE_NAME="<YOUR_DOCKERHUB_USERNAME>/my-python-app:latest"

# Pull the latest image
docker pull $DOCKER_IMAGE_NAME

# Run the new container
docker run -d --name $CONTAINER_NAME -p 80:5000 $DOCKER_IMAGE_NAME
