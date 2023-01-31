#!/usr/bin/env bash

gitlabAppDestroy() {
  local DIRS=("data" "config" "logs")

  for DIR in "${DIRS[@]}"; do
    _wexLog "Gitlab : recreating ${DIR}"

    sudo rm -rf ".wex/gitlab/${DIR}"
    mkdir ".wex/gitlab/${DIR}"
    touch ".wex/gitlab/${DIR}/.gitkeep"
  done
}
