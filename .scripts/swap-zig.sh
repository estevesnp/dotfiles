#!/usr/bin/env bash

set -e

BASE_PATH="$HOME/.local"
LINK_PATH="$BASE_PATH/bin"

ZIG_LINK_PATH="$LINK_PATH/zig"
ZIG_STABLE_PATH="$BASE_PATH/zig/zig"
ZIG_DEV_PATH="$BASE_PATH/zig-dev/zig"

ZLS_LINK_PATH="$LINK_PATH/zls"
ZLS_STABLE_PATH="$BASE_PATH/zls/zig-out/bin/zls"
ZLS_DEV_PATH="$BASE_PATH/zls-dev/zig-out/bin/zls"

for file in "$ZIG_LINK_PATH" "$ZIG_STABLE_PATH" "$ZIG_DEV_PATH" "$ZLS_LINK_PATH" "$ZLS_STABLE_PATH" "$ZLS_DEV_PATH"; do
    if [ ! -f "$file" ]; then
        echo "file $file not found"
        exit 1
    fi
done

LINK=$(readlink -f "$ZIG_LINK_PATH")

if [ -z "$LINK" ]; then
    echo "no link found at $ZIG_LINK_PATH"
    exit 1
fi

if [[ "$LINK" =~ /zig/zig$ ]]; then
    echo "switching to dev version"
    ln -sf "$ZIG_DEV_PATH" "$ZIG_LINK_PATH"
    ln -sf "$ZLS_DEV_PATH" "$ZLS_LINK_PATH"
else
    echo "switching to stable version"
    ln -sf "$ZIG_STABLE_PATH" "$ZIG_LINK_PATH"
    ln -sf "$ZLS_STABLE_PATH" "$ZLS_LINK_PATH"
fi

ZIG_VERSION=$("$ZIG_LINK_PATH" version)
ZLS_VERSION=$("$ZLS_LINK_PATH" version)

echo "zig version: $ZIG_VERSION"
echo "zls version: $ZLS_VERSION"

