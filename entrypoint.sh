#!/bin/sh

# If INSTAGRAM_COOKIES is set, create cookies.json for cobalt
if [ -n "$INSTAGRAM_COOKIES" ]; then
  mkdir -p /cookies 2>/dev/null || true
  printf '%s' "$INSTAGRAM_COOKIES" > /cookies/cookies.json
  export COOKIE_PATH=/cookies/cookies.json
  echo "[✓] Instagram cookies configured at /cookies/cookies.json"
  cat /cookies/cookies.json
fi

# Find and run cobalt's original entrypoint
if [ -f /app/src/cobalt.js ]; then
  exec node /app/src/cobalt.js
elif [ -f /src/cobalt.js ]; then
  exec node /src/cobalt.js
else
  echo "Looking for cobalt entry point..."
  find / -name "cobalt.js" -maxdepth 4 2>/dev/null
  # Try the default CMD from the base image
  exec node cobalt.js
fi
