#!/usr/bin/env bash

echo "[$(date '+%H:%M:%S')] INFO: Starting OCPP Proxy..."

cd /app
export PYTHONPATH=/app/src

exec python3 -m ocpp_proxy.main
