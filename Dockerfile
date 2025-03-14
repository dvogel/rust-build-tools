ARG arg_debian_release

FROM debian:${arg_debian_release}-slim AS base

ARG arg_rust_toolchain

WORKDIR /tmp

COPY files/etc/apt/apt.conf.d/00_disable-cache /etc/apt/apt.conf.d/00_disable-cache
COPY files/etc/apt/apt.conf.d/01_no-recommend /etc/apt/apt.conf.d/01_no-recommend

RUN apt-get update && apt-get install -y --no-install-recommends \
      apt-transport-https \
      autoconf automake autotools-dev \
      bash build-essential libtool \
      ca-certificates curl file \
      gnupg rsync ssh zip

RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain $arg_rust_toolchain --profile minimal -y

RUN mkdir /build
WORKDIR /build
ENTRYPOINT ["/bin/bash"]

