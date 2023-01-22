#!/usr/bin/env bash

rocketchatAppFirstStartInit() {
  _wexLog "Initialize mongo DB replica set"

  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"
  docker exec $(wex app::app/container -c=mongo) mongo --eval "rs.initiate({ _id: \"rs0\", members: [ { _id: 0, host: \"${APP_NAME}_mongo:27017\" } ]})"
}
