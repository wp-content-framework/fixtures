#!/usr/bin/env bash

set -e

rm -rdf "${WORKSPACE}/vendor"
rm -f "${WORKSPACE}/composer.lock"

TARGET=$(< "${WORKSPACE}/composer.json" jq -r '.require | to_entries[] | select(.value | startswith("^")) | select(.key | contains("/")) | .key')
if [[ -n "${TARGET}" ]]; then
  echo "${TARGET}" | tr '\n' ' ' | xargs php -d memory_limit=4G "$(command -v composer)" require --no-interaction --prefer-dist --no-suggest
fi
TARGET=$(< "${WORKSPACE}/composer.json" jq -r '."require-dev" | to_entries[] | select(.value | startswith("^")) | select(.key | contains("/")) | .key')
if [[ -n "${TARGET}" ]]; then
  echo "${TARGET}" | tr '\n' ' ' | xargs php -d memory_limit=4G "$(command -v composer)" require --dev --no-interaction --prefer-dist --no-suggest
fi
