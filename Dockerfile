FROM alpine

LABEL sh.demyx.image demyx/logrotate
LABEL sh.demyx.maintainer Demyx <info@demyx.sh>
LABEL sh.demyx.url https://demyx.sh
LABEL sh.demyx.github https://github.com/demyxco/demyx
LABEL sh.demyx.registry https://hub.docker.com/u/demyx

ENV TZ America/Los_Angeles

RUN set -ex; \
	apk add --no-cache --update logrotate dumb-init tzdata
    
COPY demyx.conf /etc/logrotate.d

COPY demyx-entrypoint.sh /usr/local/bin/demyx-entrypoint

RUN chmod +x /usr/local/bin/demyx-entrypoint

WORKDIR /var/log/demyx

ENTRYPOINT ["dumb-init", "demyx-entrypoint"]
