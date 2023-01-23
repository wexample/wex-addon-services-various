#!/usr/bin/env bash

mongoDbDump() {
  local DUMP_NAME="${1}"

  _wexLog "Mongo : dumping data to ${DUMP_NAME}..."
  wex app/exec -n=mongo -c="mongodump --out /dump/${DUMP_NAME}"

  _wexLog "Mongo : Zip data in ${DUMP_NAME}.zip"
  zip -r ".wex/mongo/dumps/${DUMP_NAME}.zip" ".wex/mongo/dumps/${DUMP_NAME}"

  _wexLog "Mongo : Cleaning up"
  rm -rf ".wex/mongo/dumps/${DUMP_NAME}"

  echo .wex/mongo/dumps/${DUMP_NAME}.zip
}
