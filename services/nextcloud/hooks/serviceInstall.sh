#!/usr/bin/env bash

nextcloudServiceInstall() {
  wex-exec app::config/setValue -b -k=NEXTCLOUD_VERSION -v=25.0.3
  wex-exec app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=nextcloud

  if [ "$(wex-exec app::service/user -s=mysql)" = "true" ] || [ "$(wex-exec app::service/user -s="mysql-8")" = "true" ] || [ "$(wex-exec app::service/user -s="maria-10")" = "true" ]; then
    _wexLog "Adding mysql environment variables to php docker compose"
    local SERVICE_DIR
    SERVICE_DIR=$(wex-exec app::service/dir -s=mysql)

    # Append mysql config to container configuration.
    cat "${SERVICE_DIR}docker/docker-compose.mysql.part.yml" >>"${WEX_DIR_APP_DATA}docker/docker-compose.yml"
  fi
}
