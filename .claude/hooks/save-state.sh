#!/bin/bash
# Save session state for continuity

STATE_DIR=".claude/.state"
STATE_FILE="$STATE_DIR/session-$(date +%Y%m%d-%H%M%S).json"

mkdir -p "$STATE_DIR"

# Capture current state
cat > "$STATE_FILE" << EOF
{
  "timestamp": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "branch": "$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'unknown')",
  "commit": "$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')",
  "modified_files": $(git status --porcelain | wc -l),
  "working_dir": "$(pwd)"
}
EOF

# Keep only last 10 states
ls -t "$STATE_DIR"/session-*.json | tail -n +11 | xargs rm -f 2>/dev/null

echo "✓ Session state saved to $STATE_FILE"
