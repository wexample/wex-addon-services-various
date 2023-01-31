#!/usr/bin/env bash

matomoServiceInstall() {
  wex app::config/setValue -b -k=MATOMO_VERSION -v=4.13.1-apache
  wex app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=matomo
}
