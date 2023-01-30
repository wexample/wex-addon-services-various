#!/usr/bin/env bash

collaboraAppConfig() {
  . "${WEX_FILEPATH_REL_CONFIG}"

  wex app::config/setValue -k=MAIN_CONTAINER_NAME -v=collabora
}
