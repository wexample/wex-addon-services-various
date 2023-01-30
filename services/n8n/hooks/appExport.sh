#!/usr/bin/env bash

n8nAppExport() {
  # Wrap commands to avoid use permission errors.
  wex app/exec -c="su -c \"n8n export:workflow --backup --output=/home/node/.n8n/backup/workflow\" node"
  wex app/exec -c="su -c \"n8n export:credentials --backup --output=/home/node/.n8n/backup/credentials\" node"
}
