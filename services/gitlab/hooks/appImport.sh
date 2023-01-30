#!/usr/bin/env bash

gitlabAppImport() {
  local DUMPS

  wex app/exec -su -c="chmod -R 755 /var/opt/gitlab/backups/"
  wex app/exec -su -c="chown -R git:git /var/opt/gitlab/backups/"

  DUMPS=$(find "${WEX_DIR_APP_DATA}gitlab/backups/" -type f \( -name "*.tar" \) -exec basename {} \;)
  wex prompt::prompt/choice -c="${DUMPS}" -q="Please select a Gitlab backup to restore" -d="${#DUMPS[*]}"
  DUMP=$(wex prompt::prompt/choiceGetValue)

  if [ -z "${DUMP}" ]; then
    return
  fi

  _wexLog "Stopping services..."
  wex app/exec -c="gitlab-ctl stop puma"
  wex app/exec -c="gitlab-ctl stop sidekiq"

  _wexLog "Restoring..."
  wex app/exec -su -c="gitlab-backup restore BACKUP=${DUMP%_gitlab_backup.tar}"

  _wexLog "Restating services..."
  wex app/exec -c="gitlab-ctl start sidekiq"
  wex app/exec -c="gitlab-ctl start puma"

  _wexLog "Check status..."
  wex app/exec -c="gitlab-ctl status"
  wex app/exec -c="gitlab-ctl gitlab-rake gitlab:check"
}
