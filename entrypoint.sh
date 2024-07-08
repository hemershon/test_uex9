#!/bin/bash
set -e

mkdir -p /app/tmp/pids

rm -f /app/tmp/pids/server.pid

exec "$@"