#!/usr/bin/env bash

collaboraAppConfig() {
  . "${WEX_FILEPATH_REL_CONFIG}"

  wex app::config/setValue -k=MAIN_CONTAINER_NAME -v=collabora
  wex app::config/setValue -k=COLLABORA_VERSION -v="${COLLABORA_VERSION}"

  # Must use the "default" user, but unable to override value with empty one.
  wex app::config/setValue -k=USER_UID -v=""
}
