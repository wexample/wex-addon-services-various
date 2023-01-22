#!/usr/bin/env bash

mongoDbDump() {
  _wexLog "Mongo dump..."
  local DUMP_NAME="${1}"

  if [ -n "${DUMP_NAME}" ];then
    echo "${DUMP_NAME}"
  fi
}
