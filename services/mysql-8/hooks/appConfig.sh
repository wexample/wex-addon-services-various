#!/usr/bin/env bash

mysql8AppConfig() {
  wex app::config/addTitle -t="MySql8"

  _wexLog "Set DB_CONTAINER to mysql8"
  wex app::config/setValue -k=DB_CONTAINER -v="mysql8" -s="="

  _wexLog "Set files path to docker variables"
  wex config/bindFiles -s=mysql -e=cnf

  local ACCESS=($(mysqlConfigAccess))

  # TODO

  #  . .wex
  #  . .env
  #
  #  # Load framework settings
  #  # Old feature : wex framework/settings -d=./project/
  #
  #  echo "\nDB_CONTAINER=mysql8"
  #
  #
  #  local MYSQL_CONFIG=''
  #
  #  MYSQL_CONFIG+="\nMYSQL_DB_HOST="${ACCESS[0]}
  #  MYSQL_CONFIG+="\nMYSQL_DB_PORT="${ACCESS[1]}
  #  MYSQL_CONFIG+="\nMYSQL_DB_NAME="${ACCESS[2]}
  #  MYSQL_CONFIG+="\nMYSQL_DB_USER="${ACCESS[3]}
  #  MYSQL_CONFIG+="\nMYSQL_DB_PASSWORD=${ACCESS[4]}"
  #
  #  echo ${MYSQL_CONFIG}
  #
  #  # Create connexion file info
  #  local DB_CONNECTION_FILE=./tmp/mysql.cnf
  #
  #  touch ${DB_CONNECTION_FILE}
  #  chmod 755 ${DB_CONNECTION_FILE}
  #  echo '[client]' > ${DB_CONNECTION_FILE}
  #  echo 'user = "'${ACCESS[3]}'"' >> ${DB_CONNECTION_FILE}
  #  echo 'password = "'${ACCESS[4]}'"' >> ${DB_CONNECTION_FILE}
  #  echo 'host = "'${ACCESS[0]}'"' >> ${DB_CONNECTION_FILE}
  #
  #  # Expected access level
  #  chmod 644 ${DB_CONNECTION_FILE}
}

mysqlConfigAccess() {
  local MYSQL_PASSWORD='thisIsAReallyNotSecurePassword!'

  _wexAppGoTo && . "${WEX_FILEPATH_REL_CONFIG}"

  # Host
  echo "${NAME}_${APP_ENV}_mysql8"
  # Port
  echo 3306
  # Name
  echo "${NAME}"
  # User
  echo root
  # Password
  echo "${MYSQL_PASSWORD}"
}