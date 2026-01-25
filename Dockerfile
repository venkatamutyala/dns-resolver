FROM alpine:latest

# Install Unbound, OpenSSL, and gettext
RUN apk add --no-cache \
    unbound \
    openssl \
    wget \
    gettext \
    && rm -rf /var/cache/apk/*

# FIX: Create /var/lib/unbound so unbound-anchor has a place to write
RUN mkdir -p /var/log/unbound /etc/unbound /var/lib/unbound \
    && chown -R unbound:unbound /etc/unbound /var/log/unbound /var/lib/unbound

# Download Root Hints
RUN wget https://www.internic.net/domain/named.root -O /etc/unbound/root.hints

# Setup DNSSEC Root Trust Anchor
# We ignore the error from unbound-anchor (|| true) because it returns 1 on first run
# even when it successfully creates the file.
RUN unbound-anchor -a "/var/lib/unbound/root.key" || true \
    && chown unbound:unbound /var/lib/unbound/root.key

# Copy config and script
COPY unbound.conf.template /etc/unbound/unbound.conf.template
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 53/udp 53/tcp

ENTRYPOINT ["/entrypoint.sh"]