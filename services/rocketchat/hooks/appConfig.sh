#!/usr/bin/env bash

rocketchatAppConfig() {
  . "${WEX_FILEPATH_REL_CONFIG}"

  wex app::config/setValue -k=MAIN_CONTAINER_NAME -v="rocketchat"
  wex app::config/setValue -k=ROCKETCHAT_VERSION -v="${ROCKETCHAT_VERSION}"
}
