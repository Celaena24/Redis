#!/usr/bin/env bash
set -euo pipefail

# --- CONFIG ---
SERVER_BIN="./server"
TEST_DIR="./unittests"

echo "[BUILD] Compiling Nim server..."
nim c -d:release -o:$SERVER_BIN main.nim

echo "[RUN] Starting server..."
$SERVER_BIN &
SERVER_PID=$!
sleep 1   # give server a moment to start

echo "[TEST] Running shell tests in $TEST_DIR"
FAIL=0

for test_file in "$TEST_DIR"/*.sh; do
    echo "Running: $test_file"
    if bash "$test_file"; then
        echo "✔ PASS"
    else
        echo "✘ FAIL"
        FAIL=1
    fi
done

echo "[CLEANUP] Killing server PID $SERVER_PID"
kill $SERVER_PID 2>/dev/null || true

exit $FAIL
