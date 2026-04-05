FROM ghcr.io/imputnet/cobalt:11 AS base

FROM node:22-alpine

RUN mkdir -p /cookies /app && chmod 777 /cookies

COPY --from=base /app /app
COPY setup-cookies.sh /setup-cookies.sh
RUN chmod +x /setup-cookies.sh

ENV COOKIE_PATH=/cookies/cookies.json

WORKDIR /app

EXPOSE 9000

USER 1000

CMD ["sh", "-c", "sh /setup-cookies.sh && node src/cobalt.js"]
