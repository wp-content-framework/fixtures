#!/usr/bin/env bash

set -e

if [[ ! -f "${WORKSPACE}/vendor/bin/phpcbf" ]]; then
  echo "composer phpcbf command is invalid."
  exit
fi

echo ""
echo ">> Run composer phpcbf."
if [[ -n "${GIT_DIFF}" ]]; then
  # shellcheck disable=SC2046
  "${WORKSPACE}"/vendor/bin/phpcbf --standard="${WORKSPACE}/phpcs.xml" $(eval echo "${GIT_DIFF}")
else
  "${WORKSPACE}"/vendor/bin/phpcbf --standard="${WORKSPACE}/phpcs.xml"
fi
