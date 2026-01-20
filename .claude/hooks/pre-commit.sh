#!/bin/bash
# Pre-commit validation hook
# Runs before git commit to ensure quality

# Run tests
if [ -f "package.json" ]; then
  npm test 2>/dev/null || { echo "Tests failed"; exit 1; }
elif [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
  pytest 2>/dev/null || { echo "Tests failed"; exit 1; }
elif [ -f "Cargo.toml" ]; then
  cargo test 2>/dev/null || { echo "Tests failed"; exit 1; }
elif [ -f "go.mod" ]; then
  go test ./... 2>/dev/null || { echo "Tests failed"; exit 1; }
fi

# Check for secrets
if grep -r "sk-" --include="*.py" --include="*.js" --include="*.ts" . 2>/dev/null | grep -v node_modules | grep -v ".git"; then
  echo "WARNING: Potential API key found in code"
  exit 1
fi

echo "Pre-commit checks passed"
