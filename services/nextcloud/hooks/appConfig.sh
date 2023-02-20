#!/usr/bin/env bash

nextcloudAppConfig() {
  . "${WEX_FILEPATH_REL_CONFIG}"

  if [ "$(wex-exec app::service/user -s=mysql)" = "true" ] || [ "$(wex-exec app::service/user -s="mysql-8")" = "true" ] || [ "$(wex-exec app::service/user -s="maria-10")" = "true" ];then
    _wexLog "Configuring MySQL / MariaDB for NextCloud"

    MARIA_DB_HOST=${MARIA_DB_HOST:-"${NAME}_maria_10"}
    MARIA_DB_NAME=${MARIA_DB_NAME:-"root"}
    MARIA_DB_PASSWORD=${MARIA_DB_PASSWORD:-${WEX_DEFAULT_INSECURE_PASSWORD}}
    MARIA_DB_PORT=${MARIA_DB_PORT:-3306}
    MARIA_DB_USER=${MARIA_DB_USER:-"root"}

    wex-exec app::config/setValue -k=MARIA_DB_HOST -v="${MARIA_DB_HOST}"
    wex-exec app::config/setValue -k=MARIA_DB_NAME -v="${MARIA_DB_NAME}"
    wex-exec app::config/setValue -k=MARIA_DB_PASSWORD -v="${MARIA_DB_PASSWORD}"
    wex-exec app::config/setValue -k=MARIA_DB_PORT -v="${MARIA_DB_PORT}"
    wex-exec app::config/setValue -k=MARIA_DB_USER -v="${MARIA_DB_USER}"

    # Export default credentials if not found in framework.
    export MYSQL_DB_HOST=${NAME}_nextcloud
    export MYSQL_DB_PORT=3306
    export MYSQL_DB_NAME=${NAME}
    export MYSQL_DB_USER=root
    export MYSQL_DB_PASSWORD=${WEX_DEFAULT_INSECURE_PASSWORD}

    local NEXTCLOUD_CONFIG=''
    echo -e "\nMYSQL_DB_HOST="${MYSQL_DB_HOST} >> ${WEX_WEXAMPLE_APP_FILE_CONFIG}
    echo -e "\nMYSQL_DB_PORT="${MYSQL_DB_PORT} >> ${WEX_WEXAMPLE_APP_FILE_CONFIG}
    echo -e "\nMYSQL_DB_NAME="${MYSQL_DB_NAME} >> ${WEX_WEXAMPLE_APP_FILE_CONFIG}
    echo -e "\nMYSQL_DB_USER="${MYSQL_DB_USER} >> ${WEX_WEXAMPLE_APP_FILE_CONFIG}
    echo -e "\nMYSQL_DB_PASSWORD="${MYSQL_DB_PASSWORD} >> ${WEX_WEXAMPLE_APP_FILE_CONFIG}

    MARIA_DB_HOST=${MARIA_DB_HOST:-"${NAME}_mysql8"}
    MARIA_DB_NAME=${MARIA_DB_NAME:-"root"}
    MARIA_DB_PASSWORD=${MARIA_DB_PASSWORD:-${WEX_DEFAULT_INSECURE_PASSWORD}}
    MARIA_DB_PORT=${MARIA_DB_PORT:-3306}
    MARIA_DB_USER=${MARIA_DB_USER:-"root"}

    wex-exec app::config/setValue -k=MARIA_DB_HOST -v="${MARIA_DB_HOST}"
    wex-exec app::config/setValue -k=MARIA_DB_NAME -v="${MARIA_DB_NAME}"
    wex-exec app::config/setValue -k=MARIA_DB_PASSWORD -v="${MARIA_DB_PASSWORD}"
    wex-exec app::config/setValue -k=MARIA_DB_PORT -v="${MARIA_DB_PORT}"
    wex-exec app::config/setValue -k=MARIA_DB_USER -v="${MARIA_DB_USER}"
  fi
}
