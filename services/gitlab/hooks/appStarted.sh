#!/usr/bin/env bash

gitlabAppStarted() {
  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  local START_TIME
  local CURRENT_TIME

  _wexLog "Waiting for health check..."
  while [[ $(docker inspect --format='{{.State.Health.Status}}' "${CONTEXT_NAME}_gitlab") == "starting" ]]; do
    START_TIME=$(docker inspect --format='{{.State.StartedAt}}' "${CONTEXT_NAME}_gitlab")
    START_TIME=$(date -d "${START_TIME}" +%s)
    CURRENT_TIME=$(date +%s)
    local SECONDS=$((CURRENT_TIME - START_TIME))

    echo -ne "    Status : $(docker inspect --format='{{.State.Status}}' "${CONTEXT_NAME}_gitlab") from ${SECONDS}s   \r"
    sleep 1
  done
}
