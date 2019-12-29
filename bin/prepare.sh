#!/usr/bin/env bash

set -e

current=$(
  cd "$(dirname $0)"
  pwd
)
SETTINGS_DIR="${current}/../settings"

echo ""
echo ">> Copy files."
if [[ ! -f ${WORKSPACE}/phpmd.xml ]]; then
  echo ">>>> phpmd.xml"
  cp "${SETTINGS_DIR}/phpmd.xml" "${WORKSPACE}/phpmd.xml"
fi

if [[ ! -f ${WORKSPACE}/phpcs.xml ]]; then
  echo ">>>> phpcs.xml"
  cp "${SETTINGS_DIR}/phpcs.xml" "${WORKSPACE}/phpcs.xml"
  if [[ ! -d ${WORKSPACE}/configs ]]; then
    sed -i -e '/\.\/configs\//d' "${WORKSPACE}/phpcs.xml"
  fi
  if [[ ! -d ${WORKSPACE}/tests ]]; then
    sed -i -e '/\.\/tests\//d' "${WORKSPACE}/phpcs.xml"
  fi
fi

composer install --working-dir="${WORKSPACE}" --no-interaction --prefer-dist --no-suggest
