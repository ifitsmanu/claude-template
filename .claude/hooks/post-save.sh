#!/bin/bash
# Post-save auto-format hook
# Formats files after Claude saves them
# Receives file path via CLAUDE_FILE_PATH or argument

set -e

# Get file path from environment or argument
FILE_PATH="${CLAUDE_FILE_PATH:-$1}"

if [ -z "$FILE_PATH" ]; then
  echo "No file path provided"
  exit 0
fi

if [ ! -f "$FILE_PATH" ]; then
  echo "File not found: $FILE_PATH"
  exit 0
fi

# Get file extension
EXT="${FILE_PATH##*.}"

# Format based on file type
case "$EXT" in
  # JavaScript/TypeScript/JSON/CSS/HTML/Markdown - Prettier
  js|jsx|ts|tsx|json|css|scss|html|md|yaml|yml)
    if command -v prettier &> /dev/null; then
      prettier --write "$FILE_PATH" 2>/dev/null || true
    elif command -v npx &> /dev/null; then
      npx prettier --write "$FILE_PATH" 2>/dev/null || true
    elif command -v bunx &> /dev/null; then
      bunx prettier --write "$FILE_PATH" 2>/dev/null || true
    fi
    ;;

  # Python - Ruff (format + fix)
  py)
    if command -v ruff &> /dev/null; then
      ruff format "$FILE_PATH" 2>/dev/null || true
      ruff check --fix "$FILE_PATH" 2>/dev/null || true
    elif command -v black &> /dev/null; then
      black "$FILE_PATH" 2>/dev/null || true
    fi
    ;;

  # Go - gofmt
  go)
    if command -v gofmt &> /dev/null; then
      gofmt -w "$FILE_PATH" 2>/dev/null || true
    fi
    if command -v goimports &> /dev/null; then
      goimports -w "$FILE_PATH" 2>/dev/null || true
    fi
    ;;

  # Rust - rustfmt
  rs)
    if command -v rustfmt &> /dev/null; then
      rustfmt "$FILE_PATH" 2>/dev/null || true
    fi
    ;;

  # Ruby - rubocop
  rb)
    if command -v rubocop &> /dev/null; then
      rubocop -a "$FILE_PATH" 2>/dev/null || true
    fi
    ;;

  # Shell - shfmt
  sh|bash)
    if command -v shfmt &> /dev/null; then
      shfmt -w "$FILE_PATH" 2>/dev/null || true
    fi
    ;;

  # SQL - pg_format or sql-formatter
  sql)
    if command -v pg_format &> /dev/null; then
      pg_format -i "$FILE_PATH" 2>/dev/null || true
    fi
    ;;

  # Swift - swiftformat
  swift)
    if command -v swiftformat &> /dev/null; then
      swiftformat "$FILE_PATH" 2>/dev/null || true
    fi
    ;;

  # Kotlin - ktlint
  kt|kts)
    if command -v ktlint &> /dev/null; then
      ktlint -F "$FILE_PATH" 2>/dev/null || true
    fi
    ;;

  *)
    # Unknown extension, skip formatting
    ;;
esac

# Silent success - don't clutter output
exit 0
