#!/usr/bin/env bash

set -e

rm -rdf "${WORKSPACE}/vendor"
rm -f "${WORKSPACE}/composer.lock"

modules=$(< "${WORKSPACE}/composer.json" jq -r '.require | to_entries[] | select(.key | startswith("wp")) | .key' | tr '\n' ' ')
if [[ -n "${modules}" ]]; then
  composer require --working-dir="${WORKSPACE}" --no-interaction --prefer-dist --no-suggest "${modules}"
fi
composer require --dev --working-dir="${WORKSPACE}" --no-interaction --prefer-dist --no-suggest dealerdirect/phpcodesniffer-composer-installer phpmd/phpmd squizlabs/php_codesniffer wp-coding-standards/wpcs phpcompatibility/phpcompatibility-wp
