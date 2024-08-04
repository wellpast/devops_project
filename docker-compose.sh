#!/bin/bash

# Path to the Docker Compose file
COMPOSE_FILE="docker-compose.yml"

# Prompt the user for the Docker image version
read -p "Enter the Docker image version you want to use (e.g., 17): " MY_IMAGE

# Echo the entered version
echo "You entered Docker image version: $MY_IMAGE"

# Prompt the user to choose between 'up' and 'down'
read -p "Do you want to start (up) or stop (down) the services? (Enter 'up' or 'down'): " ACTION

# Validate the ACTION input
if [[ "$ACTION" != "up" && "$ACTION" != "down" ]]; then
    echo "Invalid action. Please enter 'up' or 'down'."
    exit 1
fi

# Set the Docker image tag
IMAGE_TAG="spring-boot-app:$MY_IMAGE"

# Perform the chosen action
if [ "$ACTION" == "up" ]; then
    echo "Starting services with Docker Compose..."
    MY_IMAGE=$IMAGE_TAG docker-compose up -d
elif [ "$ACTION" == "down" ]; then
    echo "Stopping services with Docker Compose..."
    docker-compose down
fi

# Check for errors
if [ $? -eq 0 ]; then
    echo "Action completed successfully."
else
    echo "An error occurred while performing the action."
    exit 1
fi
