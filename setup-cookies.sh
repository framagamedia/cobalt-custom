#!/bin/sh

# If Instagram cookie values are set, create cookies.json for cobalt
if [ -n "$INSTAGRAM_SESSION_ID" ]; then
  mkdir -p /cookies 2>/dev/null || true
  cat > /cookies/cookies.json << COOKIEEOF
{
  "instagram": [
    {
      "domain": ".instagram.com",
      "name": "sessionid",
      "value": "${INSTAGRAM_SESSION_ID}"
    },
    {
      "domain": ".instagram.com",
      "name": "ds_user_id",
      "value": "${INSTAGRAM_DS_USER_ID}"
    },
    {
      "domain": ".instagram.com",
      "name": "csrftoken",
      "value": "${INSTAGRAM_CSRFTOKEN}"
    }
  ]
}
COOKIEEOF
  echo "[✓] Instagram cookies configured"
fi
