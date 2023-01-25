#!/usr/bin/env bash

nextcloudAppStarted() {
  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  if [[ ${NEXTCLOUD_FIRST_START} == true ]]; then
    NEXTCLOUD_FIRST_START=false

    _wexMessage "Restarting app including Nextcloud container"
    wex app/restart
    return
  fi

   _wexMessage "Nextcloud is installed and running"
}
