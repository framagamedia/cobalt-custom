FROM ghcr.io/imputnet/cobalt:11

USER root
RUN mkdir -p /cookies && chown 1000:1000 /cookies
COPY setup-cookies.sh /setup-cookies.sh
RUN chmod +x /setup-cookies.sh
USER 1000

ENV COOKIE_PATH=/cookies/cookies.json

EXPOSE 9000

CMD ["/bin/sh", "-c", "/setup-cookies.sh && node /app/src/cobalt.js"]
