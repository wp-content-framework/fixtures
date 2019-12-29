#!/usr/bin/env bash

set -e

current=$(
  cd "$(dirname $0)"
  pwd
)

bash "${current}/php/phpcs.sh"
bash "${current}/php/phpmd.sh"
