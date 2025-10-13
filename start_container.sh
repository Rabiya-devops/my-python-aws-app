#!/bin/bash
# Replace <YOUR_ECR_URI> with your actual AWS ECR URI (e.g., 123456789012.dkr.ecr.us-east-1.amazonaws.com/my-repo)
IMAGE_NAME="<YOUR_ECR_URI>/my-python-app:latest"

echo "Logging into ECR..."
# Get ECR login credentials (requires AWS CLI and IAM permissions)
# NOTE: The CodeDeploy agent runs as root, so this should work if the IAM role is correct.
aws ecr get-login-password --region <YOUR_AWS_REGION> | docker login --username AWS --password-stdin <YOUR_ECR_URI>

echo "Pulling image: $IMAGE_NAME"
docker pull $IMAGE_NAME

echo "Starting new container..."
# Run the container in detached mode, mapping the host port 80 to container port 5000
docker run -d -p 80:5000 --name my-app-container $IMAGE_NAME

echo "Application is running."