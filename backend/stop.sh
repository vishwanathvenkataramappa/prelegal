#!/bin/bash
cd "$(dirname "$0")"

if [ -f .backend.pid ]; then
  PID=$(cat .backend.pid)
  kill "$PID" 2>/dev/null && echo "Backend stopped (PID: $PID)" || echo "Backend was not running"
  rm -f .backend.pid
else
  echo "No PID file found — backend may not be running"
fi
