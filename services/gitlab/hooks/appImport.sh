#!/usr/bin/env bash

gitlabAppImport() {
  local DUMPS

  wex-exec app/exec -su -c="chmod -R 755 /var/opt/gitlab/backups/"
  wex-exec app/exec -su -c="chown -R git:git /var/opt/gitlab/backups/"

  DUMPS=$(find "${WEX_DIR_APP_DATA}gitlab/backups/" -type f \( -name "*.tar" \) -exec basename {} \;)
  wex-exec prompt::prompt/choice -c="${DUMPS}" -q="Please select a Gitlab backup to restore" -d="${#DUMPS[*]}"
  DUMP=$(wex-exec prompt::prompt/choiceGetValue)

  if [ -z "${DUMP}" ]; then
    return
  fi

  _wexLog "Stopping services..."
  wex-exec app/exec -c="gitlab-ctl stop puma"
  wex-exec app/exec -c="gitlab-ctl stop sidekiq"

  _wexLog "Restoring..."
  wex-exec app/exec -su -c="gitlab-backup restore BACKUP=${DUMP%_gitlab_backup.tar}"

  _wexLog "Restating services..."
  wex-exec app/exec -c="gitlab-ctl start sidekiq"
  wex-exec app/exec -c="gitlab-ctl start puma"

  _wexLog "Check status..."
  wex-exec app/exec -c="gitlab-ctl status"
  wex-exec app/exec -c="gitlab-ctl gitlab-rake gitlab:check"
}
