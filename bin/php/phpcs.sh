#!/usr/bin/env bash

set -e

if [[ ! -f "${WORKSPACE}/vendor/bin/phpcs" ]]; then
  echo "composer phpcs command is invalid."
  exit
fi

echo ""
echo ">> Run composer phpcs."
"${WORKSPACE}"/vendor/bin/phpcs --standard="${WORKSPACE}/phpcs.xml"
