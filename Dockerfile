FROM ghcr.io/imputnet/cobalt:11 AS base

FROM node:22-alpine

RUN mkdir -p /cookies /app && chown -R 1000:1000 /cookies /app

COPY --from=base /app /app
COPY setup-cookies.sh /setup-cookies.sh
RUN chmod +x /setup-cookies.sh

ENV COOKIE_PATH=/cookies/cookies.json

WORKDIR /app

EXPOSE 9000

CMD ["/bin/sh", "-c", "/setup-cookies.sh && node src/cobalt.js"]
