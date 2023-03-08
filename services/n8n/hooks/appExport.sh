#!/usr/bin/env bash

n8nAppExport() {
  # Wrap commands to avoid use permission errors.
  wex-exec app/exec -c="n8n export:workflow --backup --output=/home/node/.n8n/backup/workflow"
  wex-exec app/exec -c="n8n export:credentials --backup --output=/home/node/.n8n/backup/credentials"
}
