#!/usr/bin/env bash

matomoAppConfig() {
  # Inherit MySQL config from PHP
  wex-exec service/exec -s=php-8 -sf -c=appConfig -a="${1}"
}
