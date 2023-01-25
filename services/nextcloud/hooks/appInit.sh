#!/usr/bin/env bash

nextcloudAppInit() {
  wex app::config/setValue -b -k=NEXTCLOUD_VERSION -v=25.0.3
}
