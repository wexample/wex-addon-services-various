#!/usr/bin/env bash

gitlabAppExport() {
  wex app/exec -c="gitlab-backup create"
}
