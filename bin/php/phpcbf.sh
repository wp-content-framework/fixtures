#!/usr/bin/env bash

set -e

if [[ ! -f "${WORKSPACE}/vendor/bin/phpcbf" ]]; then
  echo "composer phpcbf command is invalid."
  exit
fi

echo ""
echo ">> Run composer phpcbf."
"${WORKSPACE}"/vendor/bin/phpcbf --standard="${WORKSPACE}/phpcs.xml"
