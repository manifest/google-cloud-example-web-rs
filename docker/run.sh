#!/bin/bash

source ./docker/default.profile

read -r DOCKER_RUN_COMMAND <<-EOF
    cargo run
EOF

set -xe
docker build \
    --build-arg BUILD_DIR="${DOCKER_BUILD_DIR}" \
    -t ${DOCKER_BUILDSTAGE_CONTAINER_NAME} \
    -f ./docker/Dockerfile.build .
docker run ${DOCKER_RUN_OPTIONS} \
    -p 8080:8080 \
    -v $(pwd)/src:${DOCKER_BUILD_DIR}/src \
    ${DOCKER_BUILDSTAGE_CONTAINER_NAME} \
    /bin/bash -c "set -x && cd ${DOCKER_BUILD_DIR} && ${DOCKER_RUN_COMMAND} && set +x && ${DOCKER_CONTAINER_COMMAND}"