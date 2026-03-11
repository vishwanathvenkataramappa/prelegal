#!/bin/bash
cd "$(dirname "$0")"

if [ -f .frontend.pid ]; then
  PID=$(cat .frontend.pid)
  kill "$PID" 2>/dev/null && echo "Frontend stopped (PID: $PID)" || echo "Frontend was not running"
  rm -f .frontend.pid
else
  echo "No PID file found — frontend may not be running"
fi
