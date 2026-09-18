#!/bin/bash
set -e

AWS_REGION="us-east-1"
AWS_ACCOUNT_ID="890679491516"
REPO_NAME="docker-ecr-codedeploy-pipeline"
REGISTRY="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"
IMAGE="$REGISTRY/$REPO_NAME:latest"

echo "Logging in to ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $REGISTRY

echo "Pulling latest image..."
docker pull $IMAGE

echo "Starting container..."
docker run -d --name web-app --restart unless-stopped -p 80:80 $IMAGE
