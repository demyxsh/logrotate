#!/bin/bash

# Support for old variables
[[ -n "${LOGROTATE_CONFIG:-}" ]] && DEMYX_CONFIG="$LOGROTATE_CONFIG"

# Set config file as root
/bin/chown root:root "$DEMYX_CONFIG"/logrotate.conf

# Force rotate logs
/usr/sbin/logrotate --force "$DEMYX_CONFIG"/logrotate.conf
