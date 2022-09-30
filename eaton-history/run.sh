#!/usr/bin/with-contenv bashio
#set -e

bashio::log.info "Hello from docker!"

# https://github.com/home-assistant/addons/blob/master/dhcp_server/data/run.sh#L10-L13
# Create main config
#DEFAULT_LEASE=$(bashio::config 'default_lease')
#DNS=$(bashio::config 'dns|join(", ")')
#DOMAIN=$(bashio::config 'domain')
#MAX_LEASE=$(bashio::config 'max_lease')

bashio::log.info "Trying linux-musl-x64!"
ls -l /app/linux-musl-x64
./linux-musl-x64/home-console list

bashio::log.info "Trying linux-arm64!"
ls -l /app/linux-arm64
./linux-arm64/home-console list
