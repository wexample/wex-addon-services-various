#!/usr/bin/env bash

jenkinsAppInit() {
  wex app::config/setValue -b -k=JENKINS_VERSION -v=2.60.3
  wex app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=jenkins
}
