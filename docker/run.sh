#!/bin/bash

PROJECT='google-cloud-example-web'
DOCKER_BUILD_DIR="/build"
DOCKER_CONTAINER_NAME="sandbox.build/${PROJECT}"
DOCKER_CONTAINER_COMMAND=${DOCKER_CONTAINER_COMMAND:-'/bin/bash'}
DOCKER_RUN_OPTIONS=${DOCKER_RUN_OPTIONS:-'-ti --rm'}

read -r DOCKER_RUN_COMMAND <<-EOF
    cargo run
EOF

set -xe
docker build \
    --build-arg BUILD_DIR="${DOCKER_BUILD_DIR}" \
    -t ${DOCKER_CONTAINER_NAME} \
    -f ./docker/embedded.dockerfile .
docker run ${DOCKER_RUN_OPTIONS} \
    -p 8080:8080 \
    -v $(pwd)/src:${DOCKER_BUILD_DIR}/src \
    ${DOCKER_CONTAINER_NAME} \
    /bin/bash -c "set -x && cd ${DOCKER_BUILD_DIR} && ${DOCKER_RUN_COMMAND} && set +x && ${DOCKER_CONTAINER_COMMAND}"