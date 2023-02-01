#!/usr/bin/env bash

rocketchatServiceInstall() {
  wex app::config/setValue -b -k=ROCKETCHAT_VERSION -v=5.4.0
  wex app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=rocketchat
}
