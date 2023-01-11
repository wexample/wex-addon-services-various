#!/usr/bin/env bash

rocketchatAppInit() {
  _wexLog "Initialize mongo DB replica set"
  docker exec $(wex app/container -c=mongo) mongo --eval "rs.initiate({ _id: \"rs0\", members: [ { _id: 0, host: \"chat_mongo:27017\" } ]})"
}
