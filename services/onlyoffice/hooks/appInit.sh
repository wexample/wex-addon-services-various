#!/usr/bin/env bash

onlyofficeAppInit() {
  wex app::config/setValue -b -k=ONLYOFFICE_DOCUMENT_SERVER_VERSION -v=7.2.2
  wex app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=onlyoffice
}