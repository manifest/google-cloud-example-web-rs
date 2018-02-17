## For nightly build use:
## FROM rustlang/rust
FROM rust:latest

ARG BUILD_DIR
ARG CARGO_BUILD_OPTS
ENV BUILD_DIR=${BUILD_DIR:-"/build"}

RUN USER=root cargo new "${BUILD_DIR}"
WORKDIR "${BUILD_DIR}"
COPY Cargo.toml Cargo.lock "./"
RUN cargo build ${CARGO_BUILD_OPTS} && rm -fr "./src"