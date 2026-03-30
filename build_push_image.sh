#!/bin/bash

GITHUB_USER="annasmarv" # Ganti dengan username GitHub Anda
IMAGE_NAME="item-app"
TAG="v1"

echo "Building Docker image..."
docker build -t $IMAGE_NAME:$TAG .

echo "Listing local images..."
docker images

echo "Tagging image for GHCR..."
docker tag $IMAGE_NAME:$TAG ghcr.io/$GITHUB_USER/$IMAGE_NAME:$TAG

echo "Logging in to GitHub Packages..."
echo $GH_TOKEN | docker login ghcr.io -u $GITHUB_USER --password-stdin

echo "Pushing image to GHCR..."
docker push ghcr.io/$GITHUB_USER/$IMAGE_NAME:$TAG
