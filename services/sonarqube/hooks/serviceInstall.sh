#!/usr/bin/env bash

sonarqubeServiceInstall() {
  wex app::config/setValue -b -k=SONARQUBE_VERSION -v=8.9.10-community
  wex app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=sonarqube
  wex app::config/setValue -b -k=SONARQUBE_ULIMIT_SOFT -v=65536
  wex app::config/setValue -b -k=SONARQUBE_ULIMIT_HARD -v=65536
}
