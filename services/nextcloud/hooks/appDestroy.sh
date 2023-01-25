#!/usr/bin/env bash

nextcloudAppDestroy() {
  _wexLog "Nextcloud : deleting nextcloud data"
  sudo rm -rf data

  _wexLog "Nextcloud : resetting config.php"
  wex own/this -f=config.php

  local SERVICE_DIR=$(wex app::service/dir -s=nextcloud)
  sudo cp "${SERVICE_DIR}samples/config.php" .
}