#!/usr/bin/env bash

collaboraAppConfig() {
  . "${WEX_FILEPATH_REL_CONFIG}"

  wex app::config/setValue -k=MAIN_CONTAINER_NAME -v=collabora
  wex app::config/setValue -k=COLLABORA_VERSION -v="${COLLABORA_VERSION}"
}
