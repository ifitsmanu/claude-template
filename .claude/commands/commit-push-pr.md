# Commit, Push, and Create PR

Commit current changes, push to origin, and create a pull request.

## Pre-checks
!git status --porcelain
!git branch --show-current

## Steps

1. **Stage changes**: Stage all modified and new files
   ```bash
   git add -A
   ```

2. **Commit**: Write a clear conventional commit message
   - Format: `type(scope): description`
   - Types: feat, fix, refactor, docs, test, chore
   - Keep subject under 72 characters
   - Add body if needed for context

3. **Push**: Push to origin
   ```bash
   git push -u origin HEAD
   ```

4. **Create PR**: Use gh CLI to create pull request
   ```bash
   gh pr create --fill
   ```
   - If --fill doesn't work, prompt for title and body
   - Link related issues with "Closes #123" or "Fixes #123"

## Arguments
$ARGUMENTS

If arguments provided, use as commit message hint.
If no arguments, analyze the diff to generate appropriate message.

## Safety
- Never force push
- Check for secrets in staged files before committing
- Ensure tests pass if CI is configured
