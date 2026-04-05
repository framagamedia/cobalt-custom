FROM ghcr.io/imputnet/cobalt:11

# Script that creates cookies.json from env var before starting cobalt
COPY entrypoint.sh /entrypoint.sh

USER root
RUN chmod +x /entrypoint.sh && mkdir -p /cookies
USER 1000

ENTRYPOINT ["/entrypoint.sh"]
