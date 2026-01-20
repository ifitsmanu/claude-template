#!/bin/bash
# PostToolUse hook: Auto-format files after Edit/Write
# Receives file path via CLAUDE_TOOL_OUTPUT JSON

# Extract file path from Claude's output
FILE=$(echo "$CLAUDE_TOOL_OUTPUT" | jq -r '.file_path // empty' 2>/dev/null)

# Fallback: try to get from first argument
[ -z "$FILE" ] && FILE="$1"
[ -z "$FILE" ] && exit 0

# Skip if file doesn't exist
[ ! -f "$FILE" ] && exit 0

# Get file extension
EXT="${FILE##*.}"

# Format based on file type
case "$EXT" in
  ts|tsx|js|jsx|json|md)
    # JavaScript/TypeScript - use prettier if available
    if command -v bunx &> /dev/null; then
      bunx prettier --write "$FILE" 2>/dev/null
    elif command -v npx &> /dev/null; then
      npx prettier --write "$FILE" 2>/dev/null
    fi
    ;;
  py)
    # Python - use ruff if available, fallback to black
    if command -v ruff &> /dev/null; then
      ruff format "$FILE" 2>/dev/null
      ruff check --fix "$FILE" 2>/dev/null
    elif command -v black &> /dev/null; then
      black "$FILE" 2>/dev/null
    fi
    ;;
  go)
    # Go - use gofmt
    if command -v gofmt &> /dev/null; then
      gofmt -w "$FILE" 2>/dev/null
    fi
    ;;
  rs)
    # Rust - use rustfmt
    if command -v rustfmt &> /dev/null; then
      rustfmt "$FILE" 2>/dev/null
    fi
    ;;
  rb)
    # Ruby - use rubocop if available
    if command -v rubocop &> /dev/null; then
      rubocop -A "$FILE" 2>/dev/null
    fi
    ;;
esac

exit 0
