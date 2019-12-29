#!/usr/bin/env bash

set -e

if [[ ! -f "${WORKSPACE}/vendor/bin/phpunit" ]]; then
  echo "composer phpunit command is invalid."
  exit
fi

echo ""
echo ">> Run composer phpunit."
"${WORKSPACE}"/vendor/bin/phpunit
