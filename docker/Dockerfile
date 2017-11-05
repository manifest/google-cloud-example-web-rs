## -----------------------------------------------------------------------------
## Build
## -----------------------------------------------------------------------------
FROM rust:latest as build-stage

ARG PROJECT
ARG BUILD_DIR
ENV BUILD_DIR=${BUILD_DIR:-"/build"}

WORKDIR "${BUILD_DIR}"
COPY . "./"
RUN cargo build --release

## -----------------------------------------------------------------------------
## Package
## -----------------------------------------------------------------------------
FROM ubuntu:16.04

ARG PROJECT
ARG APP_DIR
ARG BUILD_DIR
ENV PROJECT="${PROJECT}"
ENV APP_DIR=${APP_DIR:-"/app"}
ENV BUILD_DIR=${BUILD_DIR:-"/build"}

COPY --from=build-stage "${BUILD_DIR}/target/release/${PROJECT}" "${APP_DIR}/"
ENTRYPOINT ["/bin/bash", "-c", "${APP_DIR}/${PROJECT}"]