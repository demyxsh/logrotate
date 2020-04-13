FROM alpine

LABEL sh.demyx.image        demyx/logrotate
LABEL sh.demyx.maintainer   Demyx <info@demyx.sh>
LABEL sh.demyx.url          https://demyx.sh
LABEL sh.demyx.github       https://github.com/demyxco
LABEL sh.demyx.registry     https://hub.docker.com/u/demyx

# Set default variables
ENV LOGROTATE_ROOT      /demyx
ENV LOGROTATE_CONFIG    /etc/demyx
ENV LOGROTATE_LOG       /var/log/demyx
ENV TZ                  America/Los_Angeles

# Configure Demyx
RUN set -ex; \
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx; \
    \
    install -d -m 0755 -o demyx -g demyx "$LOGROTATE_ROOT"; \
    install -d -m 0755 -o demyx -g demyx "$LOGROTATE_CONFIG"; \
    install -d -m 0755 -o demyx -g demyx "$LOGROTATE_LOG"

# Install logrotate and friends
RUN set -ex; \
    apk add --no-cache --update bash dumb-init logrotate sudo tzdata

# Configure sudo
RUN set -ex; \
    echo "demyx ALL=(ALL) NOPASSWD: /usr/local/bin/demyx-logrotate" > /etc/sudoers.d/demyx; \
    echo 'Defaults env_keep +="LOGROTATE_CONFIG"' >> /etc/sudoers.d/demyx

# Copy source
COPY src "$LOGROTATE_CONFIG"

# Finalize
RUN set -ex; \
    # demyx-logrotate
    chmod +x "$LOGROTATE_CONFIG"/logrotate.sh; \
    mv "$LOGROTATE_CONFIG"/logrotate.sh /usr/local/bin/demyx-logrotate; \
    \
    # demyx-entrypoint
    chmod +x "$LOGROTATE_CONFIG"/entrypoint.sh; \
    mv "$LOGROTATE_CONFIG"/entrypoint.sh /usr/local/bin/demyx-entrypoint; \
    \
    # Reset permissions
    chown -R root:root /usr/local/bin

USER demyx

ENTRYPOINT ["dumb-init", "demyx"]
