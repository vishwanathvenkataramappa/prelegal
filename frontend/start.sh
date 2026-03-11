#!/bin/bash
set -e
cd "$(dirname "$0")"

if [ ! -d "node_modules" ]; then
  echo "Installing dependencies..."
  npm install
fi

npm run dev &
echo $! > .frontend.pid
echo "Frontend started on http://localhost:3000 (PID: $!)"
