#!/usr/bin/env bash

rocketchatAppInit() {
  _wexLog "Initialize mongo DB replica set"
  wex app/exec -c="mongo --eval 'printjson(rs.initiate())'" -n=mongo
}
