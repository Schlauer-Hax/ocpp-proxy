# Home Assistant add-on Dockerfile
FROM python:3.12-alpine

# Install system dependencies
RUN apk add --no-cache \
        gcc \
        musl-dev

# Copy application source to /app
WORKDIR /app
COPY src/ ./src/
COPY pyproject.toml poetry.lock* ./

# Install Python dependencies
RUN pip install --no-cache-dir \
        "ocpp>=2.0.0" \
        "aiohttp>=3.9.0" \
        "websockets>=12.0" \
        "PyYAML>=6.0.0" \
    && apk del gcc musl-dev

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Expose WebSocket port
EXPOSE 9000

# Labels for Home Assistant add-on
LABEL \
    io.hass.name="OCPP Proxy" \
    io.hass.description="Multi-version OCPP proxy for secure EV charger sharing" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version="${BUILD_VERSION}" \
    maintainer="OpenChargeHub" \
    org.opencontainers.image.title="OCPP Proxy" \
    org.opencontainers.image.description="Multi-version OCPP proxy for secure EV charger sharing" \
    org.opencontainers.image.vendor="OpenChargeHub" \
    org.opencontainers.image.authors="OpenChargeHub" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/openchargehub/ocpp-proxy" \
    org.opencontainers.image.source="https://github.com/openchargehub/ocpp-proxy" \
    org.opencontainers.image.documentation="https://github.com/openchargehub/ocpp-proxy" \
    org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.revision="${BUILD_REF}" \
    org.opencontainers.image.version="${BUILD_VERSION}"

CMD [ "/run.sh" ]
