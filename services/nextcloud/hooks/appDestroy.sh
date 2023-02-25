#!/usr/bin/env bash

nextcloudAppDestroy() {
  _wexLog "Nextcloud : deleting nextcloud data"
  sudo rm -rf data

  _wexLog "Nextcloud : resetting config.php"
  wex-exec own/this -f=config.php

  local SERVICE_DIR=$(wex-exec app::service/dir -s=nextcloud)
  sudo cp "${SERVICE_DIR}samples/config.php" .
}
