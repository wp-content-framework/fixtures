#!/usr/bin/env bash

set -e

if [[ ! -f "${WORKSPACE}/vendor/bin/phpunit" ]]; then
  echo "composer phpunit command is invalid."
  exit
fi

if [[ -n "${CI}" && -z "${COVERAGE}" ]]; then
  echo "Still in preparation..."
  exit
fi

options="--stop-on-failure --colors=always"
if [[ -z "${COVERAGE}" ]]; then
  options="${options} --no-coverage"
fi

echo ""
echo ">> Run composer phpunit."
"${WORKSPACE}"/vendor/bin/phpunit "${options}"
