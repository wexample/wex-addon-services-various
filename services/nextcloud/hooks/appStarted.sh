#!/usr/bin/env bash

nextcloudAppStarted() {
  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  if [[ ${NEXTCLOUD_FIRST_START} == true ]]; then
    NEXTCLOUD_FIRST_START=false

    _wexMessage "Nextcloud : Restarting app including container"
    wex app/restart

    _wexLog "Nextcloud : Define configuration protocol"
    local PROTOCOL=https;
    if [[ ${APP_ENV} == local ]];then
      PROTOCOL=http
    fi

    # Can't place this in appFirstStartInit, as this will be the second start of the app
    # and APP_INITIALIZED should be set to true.
    _wexLog "Nextcloud : Waiting 60 seconds for first install"
    sleep 60

    sudo wex file/textReplace -f=config.php -r="s/NEXTCLOUD_PROTOCOL/${PROTOCOL}/"

    _wexLog "Nextcloud : Defining trusted hostname : ${DOMAIN_MAIN}"
    wex app/exec -u=33 -c="php occ config:system:set trusted_domains 2 --value=${DOMAIN_MAIN}"

    return
  fi

   _wexMessage "Nextcloud : Installed and running"
}
