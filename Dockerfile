FROM ghcr.io/imputnet/cobalt:11 AS base

FROM node:22-alpine

RUN mkdir -p /cookies /app && chmod 777 /cookies

COPY --from=base /app /app
COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /app

EXPOSE 9000

CMD ["sh", "/start.sh"]
