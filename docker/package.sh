#!/bin/bash

source ./docker/default.profile
DOCKER_CONTAINER_NAME="sandbox/${PROJECT}"

set -xe
docker build \
    --build-arg PROJECT="${PROJECT}" \
    --build-arg BUILD_DIR="${DOCKER_BUILD_DIR}" \
    --build-arg APP_DIR="${DOCKER_APP_DIR}" \
    -t ${DOCKER_CONTAINER_NAME} \
    -f ./docker/Dockerfile .