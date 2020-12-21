FROM alpine

LABEL sh.demyx.image        demyx/logrotate
LABEL sh.demyx.maintainer   Demyx <info@demyx.sh>
LABEL sh.demyx.url          https://demyx.sh
LABEL sh.demyx.github       https://github.com/demyxco
LABEL sh.demyx.registry     https://hub.docker.com/u/demyx

# Set default variables
ENV DEMYX                   /demyx
ENV DEMYX_CONFIG            /etc/demyx
ENV DEMYX_LOG               /var/log/demyx
ENV DEMYX_PATH              "$DEMYX_LOG"
ENV TZ                      America/Los_Angeles
# Support for old variables
ENV LOGROTATE_ROOT          /demyx
ENV LOGROTATE_CONFIG        /etc/demyx
ENV LOGROTATE_LOG           /var/log/demyx

# Configure Demyx
RUN set -ex; \
    /usr/sbin/addgroup -g 1000 -S demyx; \
    /usr/sbin/adduser -u 1000 -D -S -G demyx demyx; \
    \
    /usr/bin/install -d -m 0755 -o demyx -g demyx "$DEMYX"; \
    /usr/bin/install -d -m 0755 -o demyx -g demyx "$DEMYX_CONFIG"; \
    /usr/bin/install -d -m 0755 -o demyx -g demyx "$DEMYX_LOG"

# Packages
RUN set -ex; \
    /sbin/apk --update --no-cache add bash logrotate sudo tzdata

# Configure sudo
RUN set -ex; \
    /bin/echo "demyx ALL=(ALL) NOPASSWD:SETENV: /usr/local/bin/demyx-logrotate" > /etc/sudoers.d/demyx

# Imports
COPY --chown=demyx:demyx src "$DEMYX_CONFIG"

# Finalize
RUN set -ex; \
    # demyx-logrotate
    /bin/cp "$DEMYX_CONFIG"/logrotate.sh /usr/local/bin/demyx-logrotate; \
    /bin/chmod +x /usr/local/bin/demyx-logrotate; \
    \
    # demyx-entrypoint
    /bin/cp "$DEMYX_CONFIG"/entrypoint.sh /usr/local/bin/demyx-entrypoint; \
    /bin/chmod +x /usr/local/bin/demyx-entrypoint; \
    \
    # Reset permissions
    /bin/chown -R root:root /usr/local/bin

USER demyx

ENTRYPOINT ["/usr/local/bin/demyx-entrypoint"]
