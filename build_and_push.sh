#!/bin/bash 

# Set your Docker Hub username
DOCKER_USERNAME="manoj3003"

# Set your Docker image name
IMAGE_NAME="image1"

# Build the Docker image
docker build -t $DOCKER_USERNAME/$IMAGE_NAME .

# Log in to Docker Hub
docker login -u $DOCKER_USERNAME

# Push the Docker image to Docker Hub
docker push $DOCKER_USERNAME/$IMAGE_NAME
