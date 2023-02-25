#!/usr/bin/env bash

n8nServiceInstall() {
  wex-exec app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=n8n
  wex-exec app::config/setValue -b -k=N8N_BASIC_AUTH_USER -v=admin
  wex-exec app::config/setValue -b -k=N8N_BASIC_AUTH_PASSWORD -v=${WEX_DEFAULT_INSECURE_PASSWORD}
  wex-exec app::config/setValue -b -k=N8N_VERSION -v=0.217.1
}
