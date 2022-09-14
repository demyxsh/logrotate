# logrotate
[![demyxsh/logrotate](https://github.com/demyxsh/logrotate/actions/workflows/main.yml/badge.svg)](https://github.com/demyxsh/logrotate/actions/workflows/main.yml)
[![Code Size](https://img.shields.io/github/languages/code-size/demyxsh/logrotate?style=flat&color=blue)](https://github.com/demyxsh/logrotate)
[![Repository Size](https://img.shields.io/github/repo-size/demyxsh/logrotate?style=flat&color=blue)](https://github.com/demyxsh/logrotate)
[![Watches](https://img.shields.io/github/watchers/demyxsh/logrotate?style=flat&color=blue)](https://github.com/demyxsh/logrotate)
[![Stars](https://img.shields.io/github/stars/demyxsh/logrotate?style=flat&color=blue)](https://github.com/demyxsh/logrotate)
[![Forks](https://img.shields.io/github/forks/demyxsh/logrotate?style=flat&color=blue)](https://github.com/demyxsh/logrotate)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/logrotate?style=flat&color=blue)](https://hub.docker.com/r/demyx/logrotate)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/logrotate)
[![Alpine](https://img.shields.io/badge/dynamic/json?url=https://github.com/demyxsh/logrotate/raw/master/version.json&label=alpine&query=$.alpine&color=blue)](https://hub.docker.com/r/demyx/logrotate)
[![Logrotate](https://img.shields.io/badge/dynamic/json?url=https://github.com/demyxsh/logrotate/raw/master/version.json&label=logrotate&query=$.logrotate&color=blue)](https://hub.docker.com/r/demyx/logrotate)
[![Buy Me A Coffee](https://img.shields.io/badge/buy_me_coffee-$5-informational?style=flat&color=blue)](https://www.buymeacoffee.com/VXqkQK5tb)
[![Become a Patron!](https://img.shields.io/badge/become%20a%20patron-$5-informational?style=flat&color=blue)](https://www.patreon.com/bePatron?u=23406156)

Non-root Docker image running Alpine Linux and logrotate.

DEMYX | LOGROTATE
--- | ---
PORT | 3000
USER | demyx
WORKDIR | /demyx
CONFIG | /etc/demyx
ENTRYPOINT | demyx-entrypoint
TIMEZONE | America/Los_Angeles

## NOTICE
This repository has been moved to the organization [demyxsh](https://github.com/demyxsh); please update the remote URL.
```
git remote set-url origin git@github.com:demyxsh/logrotate.git
```

# Usage
```
logrotate:
    container_name: logrotate
    image: demyx/logrotate
    restart: unless-stopped
    environment:
      DEMYX_INTERVAL
      DEMYX_PATH: /var/log/demyx
      DEMYX_ROTATE: 52
      TZ: America/Los_Angeles
    volumes:
      - /logs:/var/log/demyx
```

## logrotate.conf
```
${DEMYX_PATH}/*.log {
  su root root
  weekly
  missingok
  copytruncate
  rotate 52
  notifempty
  sharedscripts
}
```

## Updates & Support
* Auto built weekly on Saturdays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://web.libera.chat/?channel=#demyx)
