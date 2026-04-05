FROM ghcr.io/imputnet/cobalt:11

USER root
RUN mkdir -p /cookies && chown 1000:1000 /cookies
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
USER 1000

EXPOSE 9000

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
