#!/usr/bin/env bash

nextcloudAppPerms() {
  . "${WEX_FILEPATH_REL_CONFIG}"

  # On first start, do not run nextcloud until database is initialized.
  if [[ ${APP_INITIALIZED} == true ]]; then
    wex-exec app/exec -c="chown -R www-data:www-data /var/www/html/"
    wex-exec app/exec -c="chmod 777 -R /var/www/html"
    wex-exec app/exec -c="chmod 770 -R /var/www/html/config"
    wex-exec app/exec -c="chmod 770 -R /var/www/html/data"
  fi
}
