#!/bin/bash

selfdir="$(dirname "$(readlink -f "$0")")"
source "$selfdir/usage.lib.sh"

set -o errexit
set -o pipefail

if [[ -z "$1" || -z "$2" ]]; then
  usage "$0 <debian_release> <rust version>"
fi

debian_release="$1"
rust_toolchain="$2"
image_tag="${debian_release}-${rust_toolchain}"

cd "$selfdir"/buildctx
set -o xtrace
podman build -f ../Dockerfile -t rust-builder:${image_tag} --build-arg arg_debian_release="${debian_release}" --build-arg arg_rust_toolchain="${rust_toolchain}" .
