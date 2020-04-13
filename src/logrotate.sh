#!/bin/bash

# Set config file as root
chown root:root "$LOGROTATE_CONFIG"/logrotate.conf

# Force rotate logs
logrotate --force "$LOGROTATE_CONFIG"/logrotate.conf
