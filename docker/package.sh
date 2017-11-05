#!/bin/bash

source ./docker/default.profile

set -xe
docker build \
    --build-arg BUILD_DIR="${DOCKER_BUILD_DIR}" \
    --build-arg CARGO_BUILD_OPTS="--release" \
    -t ${DOCKER_BUILDSTAGE_CONTAINER_NAME} \
    -f ./docker/Dockerfile.build .
docker build \
    --build-arg PROJECT="${PROJECT}" \
    --build-arg BUILDSTAGE_IMAGE="${DOCKER_BUILDSTAGE_CONTAINER_NAME}" \
    --build-arg BUILD_DIR="${DOCKER_BUILD_DIR}" \
    --build-arg APP_DIR="${DOCKER_APP_DIR}" \
    -t ${DOCKER_CONTAINER_NAME} \
    -f ./docker/Dockerfile .