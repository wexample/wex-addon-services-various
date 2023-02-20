#!/usr/bin/env bash

nextcloudAppInit() {
  wex-exec app::config/setValue -b -k=NEXTCLOUD_VERSION -v=25.0.3
  wex-exec app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=nextcloud
}
