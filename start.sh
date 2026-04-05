#!/bin/sh

echo "=== Cobalt Custom Start ==="

# Create cookies file from env vars BEFORE cobalt starts
if [ -n "$INSTAGRAM_SESSION_ID" ]; then
  cat > /cookies/cookies.json << EOF
{
  "instagram": [
    {"domain":".instagram.com","name":"sessionid","value":"$INSTAGRAM_SESSION_ID"},
    {"domain":".instagram.com","name":"ds_user_id","value":"$INSTAGRAM_DS_USER_ID"},
    {"domain":".instagram.com","name":"csrftoken","value":"$INSTAGRAM_CSRFTOKEN"}
  ]
}
EOF
  echo "[✓] Cookies file created"
  cat /cookies/cookies.json
else
  echo "[!] No INSTAGRAM_SESSION_ID found, skipping cookies"
fi

# Set cookie path and start cobalt
export COOKIE_PATH=/cookies/cookies.json
echo "Starting cobalt..."
exec node src/cobalt.js
