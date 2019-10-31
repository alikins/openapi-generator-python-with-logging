#!/bin/bash

PACKAGE_NAME=$1
bindings_dir=$(dirname $(readlink -f "$0"))

docker run --rm -u "$(id -u)" -v "${bindings_dir}:/local" \
  openapitools/openapi-generator-cli generate \
  -i /local/openapi.yaml \
  -g python \
  -o "/local/${PACKAGE_NAME}" \
  "--additional-properties=packageName=${PACKAGE_NAME},projectName=${PACKAGE_NAME}"
