#!/bin/bash
set -e
cd "$(dirname "$0")"

if [ ! -d ".venv" ]; then
  echo "Creating virtual environment..."
  python3 -m venv .venv
  .venv/bin/pip install -r requirements.txt
fi

.venv/bin/uvicorn main:app --host 127.0.0.1 --port 8000 --reload &
echo $! > .backend.pid
echo "Backend started on http://127.0.0.1:8000 (PID: $!)"
