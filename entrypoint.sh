#!/bin/sh -l

set -ex

BASE_IMAGE=$1
BUILD_SCRIPT=$2
NETWORK=$3

cd /docker-action

echo "Creating Docker image from: $BASE_IMAGE"
docker build -t docker-action --build-arg BASE_IMAGE="$BASE_IMAGE" .

# Credit to https://github.com/zmingxie/packer-ami-builder for the following
# logic to determine the workspace directory
REPO_NAME=$(basename $RUNNER_WORKSPACE)
WORKSPACE="$RUNNER_WORKSPACE/$REPO_NAME"

echo "Using Docker network: $NETWORK"

echo "Running build script: $BUILD_SCRIPT"
docker run -t -v $WORKSPACE:$GITHUB_WORKSPACE \
--workdir $GITHUB_WORKSPACE \
--network $NETWORK \
 docker-action "$BUILD_SCRIPT"
