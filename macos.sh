#!/usr/bin/env bash

GHOSTTY_MAC_FILE='.config/ghostty/macos'

if [ -e "$GHOSTTY_MAC_FILE" ]; then
  echo "skipping $GHOSTTY_MAC_FILE"
else
  echo "creating $GHOSTTY_MAC_FILE"

  cat > "$GHOSTTY_MAC_FILE" <<EOF
font-size = 14

EOF

fi
