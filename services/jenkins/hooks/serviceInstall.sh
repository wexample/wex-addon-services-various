#!/usr/bin/env bash

jenkinsServiceInstall() {
  wex-exec app::config/setValue -b -k=JENKINS_VERSION -v=2.392
  wex-exec app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=jenkins
}
