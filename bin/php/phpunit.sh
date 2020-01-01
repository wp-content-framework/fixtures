#!/usr/bin/env bash

set -e

if [[ ! -f "${WORKSPACE}/vendor/bin/phpunit" ]]; then
  echo "composer phpunit command is invalid."
  exit
fi

if [[ -n "${CI}" ]]; then
  echo "Still in preparation..."
  exit
fi

echo ""
echo ">> Run composer phpunit."
"${WORKSPACE}"/vendor/bin/phpunit --stop-on-failure --colors=always --no-coverage
