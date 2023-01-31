#!/usr/bin/env bash

gitlabInit() {
  # TODO
  # > set external_url to the main domain without https
  # > set gitlab_ssh_host to the main domain
  # > set gitlab_ssh_port to the custom port (4567)
  # -> It will auto configure scp-style URL on clone popup

  wex app::config/setValue -b -k=GITLAB_VERSION -v=15.8.0-ce.0
  wex app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=gitlab
}
