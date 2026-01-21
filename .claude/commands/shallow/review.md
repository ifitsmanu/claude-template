# /review - Code Review

Thorough code review with optional security focus. Uses reviewer agent.

## When to Use
- Before merging code
- After significant changes
- When code quality is uncertain

## Arguments
$ARGUMENTS - Files/directories to review, optional flags

## Flags
- `--security` - Include security agent for OWASP review
- `--performance` - Include performance agent
- `--all` - Review all uncommitted changes

## Process

1. **Identify scope**
   - Parse arguments for files/directories
   - If `--all`, use `git diff --name-only`

2. **Run reviewer agent**
   - Check for logic errors
   - Verify style consistency
   - Identify edge cases
   - Check error handling

3. **Run specialist agents** (if flagged)
   - `--security`: Run security agent
   - `--performance`: Run performance agent

4. **Compile report**
   - Aggregate findings by severity
   - Provide verdict

## Agents
- Primary: `reviewer` (Sonnet)
- Optional: `security` (Sonnet), `performance` (Sonnet)

## Example
```
/review src/auth/
/review --security src/api/
/review --all
/review --security --performance src/
```

## Output Format
```
## Code Review

### Files Reviewed
- [file] ([lines changed])

### Critical Issues
- [file:line] [CRITICAL] [description]

### High Priority
- [file:line] [HIGH] [description]

### Medium Priority  
- [file:line] [MEDIUM] [description]

### Suggestions
- [file:line] [LOW] [suggestion]

### Security Findings (if --security)
- [file:line] [CWE-XXX] [finding]

### Performance Findings (if --performance)
- [file:line] [finding]

## Verdict: APPROVE | REQUEST_CHANGES | BLOCK

### Summary
[Brief explanation of verdict]
```

## Severity Guide
- **CRITICAL**: Must fix (bugs, security, data loss)
- **HIGH**: Should fix before merge
- **MEDIUM**: Fix soon
- **LOW**: Consider fixing

## Rules
- Be specific with file:line references
- No false positives
- BLOCK on critical/high security issues
- Focus on real problems, not style nitpicks
