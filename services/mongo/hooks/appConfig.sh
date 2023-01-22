#!/usr/bin/env bash

mongoAppConfig() {
  . "${WEX_FILEPATH_REL_CONFIG}"

  wex app::config/setValue -k=MONGO_VERSION -v="${MONGO_VERSION}"
}
