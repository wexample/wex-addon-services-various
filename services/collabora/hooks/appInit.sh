#!/usr/bin/env bash

collaboraAppInit() {
  wex-exec app::config/setValue -b -k=COLLABORA_VERSION -v=22.05.9.2.1
  wex-exec app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=collabora
}
