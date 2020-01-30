#!/usr/bin/env bash

set -e

if [[ ! -f "${WORKSPACE}/vendor/bin/phpcs" ]]; then
  echo "composer phpcs command is invalid."
  exit
fi

echo ""
echo ">> Run composer phpcs."
if [[ -n "${GIT_DIFF}" ]]; then
  # shellcheck disable=SC2046
  "${WORKSPACE}"/vendor/bin/phpcs --standard="${WORKSPACE}/phpcs.xml" $(eval echo "${GIT_DIFF}")
else
  "${WORKSPACE}"/vendor/bin/phpcs --standard="${WORKSPACE}/phpcs.xml"
fi
