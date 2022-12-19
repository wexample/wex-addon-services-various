#!/usr/bin/env bash

mysql8Config() {
  # TODO Import and rewrite v3 config.
  _wexLog "Set DB_CONTAINER to mysql8"
  wex app::config/addTitle -t="Mysql8"

  # Change main container name only.
  wex app::config/setValue -k=DB_CONTAINER -v="mysql8"

  wex service/templates -s=mysql -e=cnf

#  . .wex
#  . .env
#
#  # Load framework settings
#  # Old feature : wex framework/settings -d=./project/
#
#  echo "\nDB_CONTAINER=mysql8"
#
#  local ACCESS=($(mysqlConfigAccess))
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

