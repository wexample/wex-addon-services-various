#!/usr/bin/env bash

rocketchatAppFirstStartInit() {
  _wexLog "Initialize mongo DB replica set"

  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"
  docker exec $(wex-exec app::app/container -c=mongo) mongosh --eval "rs.initiate({ _id: \"rs0\", members: [ { _id: 0, host: \"${APP_NAME}_mongo_6:27017\" } ]})"
}
