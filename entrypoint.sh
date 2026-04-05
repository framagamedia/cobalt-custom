#!/bin/sh

# If INSTAGRAM_COOKIES is set, create cookies.json for cobalt
if [ -n "$INSTAGRAM_COOKIES" ]; then
  echo "$INSTAGRAM_COOKIES" > /cookies/cookies.json
  export COOKIE_PATH=/cookies/cookies.json
  echo "[✓] Instagram cookies configured"
fi

# Start cobalt
exec node src/cobalt.js
