#!/usr/bin/env bash

n8nAppInit() {
  wex app::config/setValue -b -k=N8N_VERSION -v=0.213.0
  wex app::config/setValue -b -k=N8N_BASIC_AUTH_USER -v=admin
  wex app::config/setValue -b -k=N8N_BASIC_AUTH_PASSWORD -v="${WEX_DEFAULT_INSECURE_PASSWORD}"
  wex app::config/setValue -b -k=SHELL_COMMAND -v=/bin/sh
}
