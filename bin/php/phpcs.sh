#!/usr/bin/env bash

set -e

if [[ ! -f "${WORKSPACE}/vendor/bin/phpcs" ]]; then
  echo "composer phpcs command is invalid."
  exit
fi

echo ""
echo ">> Run composer phpcs."
if [[ -n "${GIT_DIFF_FILTERED}" ]]; then
  # shellcheck disable=SC2046
  "${WORKSPACE}"/vendor/bin/phpcs --cache --standard="${WORKSPACE}/phpcs.xml" $(eval echo "${GIT_DIFF_FILTERED}")
else
  "${WORKSPACE}"/vendor/bin/phpcs --cache --standard="${WORKSPACE}/phpcs.xml"
fi
