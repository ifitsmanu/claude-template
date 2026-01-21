# /refactor - Code Simplification

Simplify code without changing behavior. Tests must pass before and after.

## When to Use
- Code works but is messy
- Too many abstractions
- Duplicated logic
- Complex conditionals

## When NOT to Use
- Code is broken (use `/fix` first)
- Behavior needs to change (that's a feature)
- No tests exist (add tests first)

## Arguments
$ARGUMENTS - Files/directories to refactor

## Process

1. **Verify tests exist and pass**
   ```bash
   # Run existing tests
   npm test || pytest || cargo test
   ```
   If tests fail: STOP. Fix tests first.

2. **Analyze with reviewer agent**
   - Identify complexity hotspots
   - Find code smells
   - Suggest simplifications

3. **Refactor with builder agent**
   - Extract functions
   - Inline unnecessary abstractions
   - Simplify conditionals
   - Remove dead code
   - Reduce duplication

4. **Verify tests still pass**
   ```bash
   # Run tests again
   npm test || pytest || cargo test
   ```
   If tests fail: REVERT and report.

5. **Report changes**

## Agents
- Phase 1: `reviewer` (analyze)
- Phase 2: `builder` (implement)

## Refactoring Techniques
- **Extract**: Pull code into named function
- **Inline**: Replace abstraction with direct code
- **Rename**: Clarify intent with better names
- **Simplify**: Reduce nested conditionals
- **Remove**: Delete dead/unused code
- **Consolidate**: Merge duplicated logic

## Example
```
/refactor src/utils/
/refactor src/services/auth.ts
```

## Output Format
```
## Refactoring Summary

### Before
- Complexity score: [estimate]
- Issues identified:
  - [file:line] [issue]

### Changes Made
- [file:line] [technique] [description]

### After
- Complexity score: [estimate]
- Lines removed: [count]
- Functions simplified: [count]

### Test Results
- Before: PASS ([count] tests)
- After: PASS ([count] tests)

## Status: SUCCESS | BLOCKED | REVERTED
[If REVERTED: why tests failed]
```

## Rules
- NEVER change behavior
- ALWAYS verify tests pass
- No new features
- No new abstractions
- Simpler is better
- If tests don't exist, add them first with /test
