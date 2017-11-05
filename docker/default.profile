##!/bin/bash

PROJECT='google-cloud-example-web'
DOCKER_APP_DIR="/app"
DOCKER_BUILD_DIR="/build"
DOCKER_CONTAINER_NAME="sandbox/${PROJECT}"
DOCKER_BUILDSTAGE_CONTAINER_NAME="sandbox.build/${PROJECT}"
DOCKER_CONTAINER_COMMAND=${DOCKER_CONTAINER_COMMAND:-'/bin/bash'}
DOCKER_RUN_OPTIONS=${DOCKER_RUN_OPTIONS:-'-ti --rm'}