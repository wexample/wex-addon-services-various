#!/usr/bin/env bash

nextcloudAppStartOptions() {
  . "${WEX_FILEPATH_REL_CONFIG}"

  # On first start, do not run nextcloud until database is initialized.
  if [[ ${APP_INITIALIZED} != true ]]; then
    wex app::config/setValue -k=NEXTCLOUD_FIRST_START -v=true

    # Ask to not start nextcloud container.
    echo " --scale drive_nextcloud=0"
  fi
}
