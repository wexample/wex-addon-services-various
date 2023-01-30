#!/usr/bin/env bash

gitlabAppConfig() {
  wex app::config/setValue -k=MAIN_CONTAINER_NAME -v=gitlab
}
