#!/usr/bin/env bash
set -euo pipefail

HOST="127.0.0.1"
PORT=5000

# Try to connect using nc (netcat)
if echo "ping" | nc -w 2 "$HOST" "$PORT"; then
    exit 0  # success
else
    echo "Could not connect to $HOST:$PORT"
    exit 1
fi
