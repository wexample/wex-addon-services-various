#!/usr/bin/env bash

matomoServiceInstall() {
  wex-exec app::config/setValue -b -k=MATOMO_VERSION -v=4.13.1-apache
  wex-exec app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=matomo
}
