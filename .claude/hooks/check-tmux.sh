#!/bin/bash
# Check if running in tmux for dev server commands

# Check if we're in tmux
if [ -z "$TMUX" ]; then
  echo "❌ Dev servers should run in tmux for persistent logs"
  echo "   Run: tmux new -s dev"
  echo "   Or: tmux attach -t dev"
  exit 1
fi

exit 0
