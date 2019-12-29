#!/usr/bin/env bash

set -e

current=$(
  cd "$(dirname $0)"
  pwd
)
SETTINGS_DIR="${current}/../settings"

composer install --working-dir="${WORKSPACE}" --no-interaction --prefer-dist --no-suggest

echo ""
echo ">> Copy files."

if [[ -f "${WORKSPACE}/vendor/bin/phpmd" ]]; then
  if [[ ! -f ${WORKSPACE}/phpmd.xml ]]; then
    echo ">>>> phpmd.xml"
    cp "${SETTINGS_DIR}/phpmd.xml" "${WORKSPACE}/phpmd.xml"
  fi
fi

if [[ -f "${WORKSPACE}/vendor/bin/phpcs" ]]; then
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
fi

if [[ -f "${WORKSPACE}/vendor/bin/phpunit" ]]; then
  if [[ ! -f ${WORKSPACE}/phpunit.xml ]]; then
    echo ">>>> phpunit.xml"
    cp "${SETTINGS_DIR}/phpunit.xml" "${WORKSPACE}/phpunit.xml"
  fi
fi
