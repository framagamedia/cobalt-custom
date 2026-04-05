FROM ghcr.io/imputnet/cobalt:11 AS base

FROM node:22-alpine

COPY --from=base /app /app
COPY cookies.json /cookies/cookies.json

RUN chmod 644 /cookies/cookies.json

ENV COOKIE_PATH=/cookies/cookies.json

WORKDIR /app
EXPOSE 9000

CMD ["node", "src/cobalt.js"]
