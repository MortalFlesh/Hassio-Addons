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
./linux-musl-arm64/home-console home:web:run \
    --host="$EATON_HOST"            \
    --name="$EATON_NAME"            \
    --password="$EATON_PASSWORD"    \
