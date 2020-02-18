#!/usr/bin/env bash

set -e

if [[ ! -f "${WORKSPACE}/vendor/bin/phpmd" ]]; then
  echo "composer phpmd command is invalid."
  exit
fi

exclude=""
if [[ -d "${WORKSPACE}/src/views" ]]; then
  exclude="--exclude ./src/views/*"
fi

echo ""
echo ">> Run composer phpmd."
if [[ -n "${GIT_DIFF_FILTERED}" ]]; then
  "${WORKSPACE}"/vendor/bin/phpmd "$(eval echo "${GIT_DIFF_FILTERED}")" ansi "${WORKSPACE}/phpmd.xml" "${exclude}"
else
  targets="./src/"
  if [[ -d "${WORKSPACE}/configs" ]]; then
    targets="${targets},./configs/"
  fi
  if [[ -d "${WORKSPACE}/config" ]]; then
    targets="${targets},./config/"
  fi
  if [[ -d "${WORKSPACE}/tests" ]]; then
    targets="${targets},./tests/"
  fi
  if [[ -d "${WORKSPACE}/resources" ]]; then
    targets="${targets},./resources/"
  fi
  if [[ -d "${WORKSPACE}/routes" ]]; then
    targets="${targets},./routes/"
  fi
  "${WORKSPACE}"/vendor/bin/phpmd "${targets}" ansi "${WORKSPACE}/phpmd.xml" "${exclude}"
fi
