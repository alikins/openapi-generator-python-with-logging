#!/bin/bash

PACKAGE_NAME=$1
bindings_dir=$(dirname $(readlink -f "$0"))

openapitools/openapi-generator-cli generate \
  -i openapi.yaml \
  -g python \
  -o "${PACKAGE_NAME}" \
  "--additional-properties=packageName=${PACKAGE_NAME},projectName=${PACKAGE_NAME}"
