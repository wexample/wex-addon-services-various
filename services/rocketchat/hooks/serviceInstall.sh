#!/usr/bin/env bash

rocketchatServiceInstall() {
  wex-exec app::config/setValue -b -k=ROCKETCHAT_VERSION -v=5.4.0
  wex-exec app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=rocketchat
}
