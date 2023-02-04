#!/usr/bin/env bash

n8nAppImport() {
  # Wrap commands to avoid use permission errors.
  wex app/exec -c="su -c \"n8n import:workflow --separate --input=/home/node/.n8n/backup/workflow/\" node"
  wex app/exec -c="su -c \"n8n import:credentials --separate --input=/home/node/.n8n/backup/credentials/\" node"
}