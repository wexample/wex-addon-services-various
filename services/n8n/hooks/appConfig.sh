#!/usr/bin/env bash

n8nAppConfig() {
  . "${WEX_FILEPATH_REL_CONFIG}"

  wex app::config/setValue -k=MAIN_CONTAINER_NAME -v=n8n
}
