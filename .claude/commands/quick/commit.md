# /commit - Safe Commit

Stage, lint, test, and commit changes. Blocks if quality gates fail.

## When to Use
- Work is complete
- Ready to save progress
- Before switching tasks

## Process

1. **Stage changes**
   ```bash
   git add -A
   ```

2. **Run linter** (if available)
   ```bash
   # Detect and run appropriate linter
   npm run lint || yarn lint || bun lint || ruff check . || cargo clippy
   ```

3. **Run tests** (if available)
   ```bash
   # Detect and run appropriate test runner
   npm test || yarn test || bun test || pytest || cargo test || go test ./...
   ```

4. **Check for secrets**
   ```bash
   # Scan staged files for potential secrets
   git diff --cached | grep -E "(sk-|api_key|password|secret)" && echo "WARNING: Potential secrets detected"
   ```

5. **Commit**
   ```bash
   git commit -m "[type]: [description]"
   ```

## Commit Message Format
```
type: short description

[optional body]

[optional footer]
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `refactor`: Code change that neither fixes nor adds
- `docs`: Documentation only
- `test`: Adding tests
- `chore`: Maintenance tasks

## Arguments
$ARGUMENTS - Optional commit message (auto-generated if not provided)

## Quality Gates (Must Pass)
- [ ] Linting passes
- [ ] Tests pass
- [ ] No secrets in diff

## Blocks If
- Tests fail → Fix tests first
- Lint fails → Fix lint errors first
- Secrets detected → Remove secrets first

## Example
```
/commit "feat: add user authentication"
/commit  # Auto-generates message from changes
```

## Output Format
```
## Commit Result

### Quality Checks
- Lint: PASS | FAIL
- Tests: PASS | FAIL | SKIPPED
- Secrets: CLEAN | WARNING

### Commit
- Hash: [short hash]
- Message: [commit message]
- Files: [count] changed

### Status: SUCCESS | BLOCKED
[If BLOCKED: what failed and why]
```
