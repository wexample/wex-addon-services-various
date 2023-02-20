#!/usr/bin/env bash

n8nAppInit() {
  wex-exec app::config/setValue -b -k=N8N_VERSION -v=0.213.0
  wex-exec app::config/setValue -b -k=N8N_BASIC_AUTH_USER -v=admin
  wex-exec app::config/setValue -b -k=N8N_BASIC_AUTH_PASSWORD -v="${WEX_DEFAULT_INSECURE_PASSWORD}"
  wex-exec app::config/setValue -b -k=SHELL_COMMAND -v=/bin/sh
  wex-exec app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=n8n
}
