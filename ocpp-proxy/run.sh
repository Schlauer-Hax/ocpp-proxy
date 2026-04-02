#!/command/with-contenv bashio

bashio::log.info "Starting OCPP Proxy..."

# Change to application directory and set PYTHONPATH
cd /app
export PYTHONPATH=/app/src

# Start the OCPP Proxy
exec python3 -m ocpp_proxy.main
