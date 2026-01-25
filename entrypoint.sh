#!/bin/sh

# 1. Update Root Hints (Standard practice on restart)
echo "Updating Root Hints..."
wget https://www.internic.net/domain/named.root -O /etc/unbound/root.hints 2>/dev/null

# 2. Inject ENV variables into config
envsubst < /etc/unbound/unbound.conf.template > /etc/unbound/unbound.conf

# 3. Ensure permissions
chown -R unbound:unbound /etc/unbound /var/lib/unbound

# 4. Start Unbound
echo "Starting Recursive Resolver with Max TTL: $TTL_MAX..."
exec unbound -d -c /etc/unbound/unbound.conf