#!/usr/bin/env bash

gitlabAppExport() {
  wex-exec app/exec -c="gitlab-backup create"
}
