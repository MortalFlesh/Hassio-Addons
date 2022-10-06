#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

set -e

bashio::log.info "Eaton addon is starting!"

# https://github.com/home-assistant/addons/blob/master/dhcp_server/data/run.sh#L10-L13
EATON_HOST=$(bashio::config 'eaton_host')
EATON_NAME=$(bashio::config 'eaton_name')
EATON_PASSWORD=$(bashio::config 'eaton_password')

mkdir eaton-history

bashio::log.info "Running home console web server!"
./alpine.3.16-arm64/home-console home:web:run \
    --host="$EATON_HOST"            \ # Host IP of the eaton controller. \
    --name="$EATON_NAME"            \ # Name for eaton controller. [default: "admin"] \
    --password="$EATON_PASSWORD"    \ # Password for eaton controller. \
    # --cookies-path=""             \ # Path for a credentials file. [default: "./eaton-cookies.json"]
    # --history-path[=HISTORY-PATH] \ # Path for a downloaded history directory. [default: "./eaton-history"]
