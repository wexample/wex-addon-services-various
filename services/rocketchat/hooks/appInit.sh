#!/usr/bin/env bash

rocketchatAppInit() {
  wex app::config/setValue -b -k=ROCKETCHAT_VERSION -v=5.4.0
}
