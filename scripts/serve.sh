#!/usr/bin/env bash
# (Re)start the local MkDocs dev server in the background.
#
# MkDocs' file watcher doesn't reliably pick up brand-new files/directories
# added after it starts, so this script always force-kills any previous
# instance on the same port before starting a fresh one.
set -euo pipefail
cd "$(dirname "$0")/.."

HOST="127.0.0.1"
PORT="8765"

pkill -f "mkdocs serve -a ${HOST}:${PORT}" 2>/dev/null || true
sleep 1

nohup mkdocs serve -a "${HOST}:${PORT}" > /dev/null 2>&1 &
disown
sleep 2

echo "Serving at http://${HOST}:${PORT}/"
