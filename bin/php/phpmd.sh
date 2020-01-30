#!/usr/bin/env bash

set -e

if [[ ! -f "${WORKSPACE}/vendor/bin/phpmd" ]]; then
  echo "composer phpmd command is invalid."
  exit
fi

targets="./src/"
if [[ -d "${WORKSPACE}/configs" ]]; then
  targets="${targets},./configs/"
fi
if [[ -d "${WORKSPACE}/tests" ]]; then
  targets="${targets},./tests/"
fi

exclude=""
if [[ -d "${WORKSPACE}/src/views" ]]; then
  exclude="--exclude ./src/views/*"
fi

echo ""
echo ">> Run composer phpmd."
if [[ -n "${GIT_DIFF}" ]]; then
  "${WORKSPACE}"/vendor/bin/phpmd "$(eval echo "${GIT_DIFF}")" "${targets}" ansi "${WORKSPACE}/phpmd.xml" "${exclude}"
else
  "${WORKSPACE}"/vendor/bin/phpmd "${targets}" ansi "${WORKSPACE}/phpmd.xml" "${exclude}"
fi
