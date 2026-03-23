#!/bin/bash
set -e

IMAGE="mohanbakthi/python-flask-app:latest"
CONTAINER="python-flask-app"
PORT="5000"

echo "Pulling latest image..."
docker pull $IMAGE

echo "Stopping old container..."
docker stop $CONTAINER || true

echo "Removing old container..."
docker rm $CONTAINER || true

echo "Starting new container..."
docker run -d --name $CONTAINER -p $PORT:$PORT $IMAGE

echo "Waiting for app..."
sleep 5

echo "Health check..."
curl -f http://localhost:$PORT/health

echo "Python deployment successful"
