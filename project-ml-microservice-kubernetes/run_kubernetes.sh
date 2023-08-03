#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="tholv2/app"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment udacity-app --image $dockerpath

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
podname=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")
kubectl port-forward $podname 8000:80