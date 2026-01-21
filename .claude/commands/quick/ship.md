# /ship - Full Release Workflow

Commit, push, and create PR in one command. The fastest path to production.

## When to Use
- Feature is complete
- Ready for review/merge
- All tests passing

## Process

1. **Run /commit**
   - Stage all changes
   - Lint check
   - Test check
   - Create commit

2. **Push to remote**
   ```bash
   git push origin HEAD
   ```

3. **Create Pull Request**
   ```bash
   gh pr create --fill
   # or
   # Output PR creation link if gh not available
   ```

## Arguments
$ARGUMENTS - Optional PR title/description

## Prerequisites
- `gh` CLI installed (optional, for auto-PR)
- Git remote configured
- Branch pushed

## Example
```
/ship "Add user authentication with OAuth"
/ship  # Auto-generates PR from commits
```

## Output Format
```
## Ship Result

### Commit
- Hash: [short hash]
- Message: [message]

### Push
- Branch: [branch name]
- Remote: [remote name]

### Pull Request
- URL: [PR link]
- Title: [PR title]
- Status: CREATED | DRAFT | FAILED

### Status: SUCCESS | BLOCKED
[If BLOCKED: what failed]
```

## Fallback (No gh CLI)
If `gh` is not available:
```
## Manual PR Creation

Push successful. Create PR manually:
https://github.com/[org]/[repo]/compare/[branch]
```

## Rules
- All quality gates from /commit apply
- PR title from first commit or argument
- PR body from commit messages
- Draft PR if WIP in branch name
