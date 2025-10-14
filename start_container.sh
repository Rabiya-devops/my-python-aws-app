#!/bin/bash
CONTAINER_NAME="my-python-app-container"

DOCKERHUB_USERNAME="Rabiya-devops"
IMAGE_NAME="my-python-aws-app"
DOCKER_IMAGE_PATH="$DOCKERHUB_USERNAME/$IMAGE_NAME:latest"

# 2. Pull the latest image from Docker Hub
echo "Pulling latest image: $DOCKER_IMAGE_PATH"
docker pull $DOCKER_IMAGE_PATH

# 3. Run the new container
# -d: run in detached mode
# -p 80:5000: map host port 80 to container port 5000
# --name: assign a custom name
echo "Starting new container..."
docker run -d --name $CONTAINER_NAME -p 80:5000 $DOCKER_IMAGE_PATH
