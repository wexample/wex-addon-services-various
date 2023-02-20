#!/usr/bin/env bash

jenkinsAppInit() {
  wex-exec app::config/setValue -b -k=JENKINS_VERSION -v=2.389
  wex-exec app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=jenkins
}
