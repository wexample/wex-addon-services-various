#!/usr/bin/env bash

nextcloudAppStarted() {
  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  if [[ ${NEXTCLOUD_FIRST_START} == true ]]; then
    NEXTCLOUD_FIRST_START=false

    _wexMessage "Nextcloud : Restarting app including container"
    wex-exec app/restart

    # Can't place this in appFirstStartInit, as this will be the second start of the app
    # and APP_INITIALIZED should be set to true.
    _wexLog "Nextcloud : Waiting 60 seconds for first install"
    sleep 60

    _wexLog "Nextcloud : Defining trusted hostname : ${DOMAIN_MAIN}"
    sudo wex app/exec -u=33 -c="php occ config:system:set trusted_domains 0 --value=${DOMAIN_MAIN}"

    _wexLog "Nextcloud : Define configuration protocol"
    local PROTOCOL=https

    if [[ ${CONTEXT_ENV} == local ]]; then
      PROTOCOL=http
    fi
    sudo wex app/exec -u=33 -c="php occ config:system:set overwriteprotocol --value=http"

    return
  fi

  _wexMessage "Nextcloud : Installed and running"
}
