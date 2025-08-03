#!/usr/bin/env bash

GHOSTTY_MAC_FILE='.config/ghostty/macos'

cat > "$GHOSTTY_MAC_FILE" <<EOF
# macos only config

font-size = 14
macos-option-as-alt = true

EOF
