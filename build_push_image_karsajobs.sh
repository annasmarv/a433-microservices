#!/bin/bash

GH_USER="annasmarv"
IMAGE_NAME="karsajobs"

# 1. Build Image    
docker build -t ghcr.io/$GH_USER/$IMAGE_NAME:latest .

# 2. Login 
echo $CR_PAT | docker login ghcr.io -u $GH_USER --password-stdin

# 3. Push Image
docker push ghcr.io/$GH_USER/$IMAGE_NAME:latest