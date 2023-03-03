#!/usr/bin/env bash

grafanabServiceInstall() {
  wex-exec app::config/setValue -b -k=GRAFANA_VERSION -v=9.4.3
  wex-exec app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=grafana
}
