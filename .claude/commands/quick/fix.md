# /fix - Quick Bug Fix

Zero-overhead command for obvious bugs. No planning, no deep thinking - just fix it.

## When to Use
- Bug has obvious cause
- Fix is straightforward
- No architectural implications

## When NOT to Use
- Root cause unclear (use `/debug`)
- Fix requires design decisions (use `/plan`)
- Security-sensitive code (add `--security` review)

## Arguments
$ARGUMENTS - Description of the bug to fix

## Process

1. **Locate the bug**
   - Search for relevant code
   - Identify the failure point

2. **Fix it**
   - Make minimal changes
   - Don't refactor surrounding code
   - Match existing patterns

3. **Verify**
   - Run tests if available
   - Manual verification if no tests

4. **Report**
   - Output what was changed
   - Output verification result

## Agent
Uses: `debugger` agent (Haiku - fast)

## Example
```
/fix "login button not responding on mobile"
```

## Output Format
```
## Fix Applied

### Changes
- [file:line] [what was changed]

### Verification
- [how it was verified]

### Status: SUCCESS | FAILED
```

## Rules
- No refactoring
- No feature additions  
- No dependency changes
- Minimal changes only
- If unclear, escalate to `/debug`
