#!/usr/bin/env bash

matomoServiceInstall() {
  # Inherit MySQL config from PHP
  wex-exec service/exec -s=php-8 -sf -c=serviceInstall -a="${1}"

  wex-exec service/install -s=php-8 -g=${1} \
    -ic=false \
    -id=false

  wex-exec app::config/setValue -b -k=MATOMO_VERSION -v=4.13.1-apache
  wex-exec app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=matomo
}
