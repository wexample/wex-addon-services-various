#!/usr/bin/env bash

matomoAppPerms() {
  wex app::app/exec -c="chmod -R 777 /var/www/html/tmp/"
}
