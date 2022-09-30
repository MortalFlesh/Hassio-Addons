#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Hello from docker!"
ls -l /app/linux-arm64/

# https://github.com/home-assistant/addons/blob/master/dhcp_server/data/run.sh#L10-L13
# Create main config
#DEFAULT_LEASE=$(bashio::config 'default_lease')
#DNS=$(bashio::config 'dns|join(", ")')
#DOMAIN=$(bashio::config 'domain')
#MAX_LEASE=$(bashio::config 'max_lease')

./app/linux-arm64/home-console list
