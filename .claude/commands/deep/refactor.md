# /deep/refactor - Safe Large-Scale Refactoring

Plan and execute major refactoring with safety checks, intermediate commits, and verification at each step.

## When to Use
- Multi-file refactoring
- Renaming across codebase
- Extracting abstractions
- Restructuring modules
- Pattern enforcement

## When NOT to Use
- Single-file changes (use `/fix` or manual edit)
- Unclear goals (use `/deep/plan` first)

## Arguments
$ARGUMENTS - Refactoring description

## Process

1. **Analyze Current State**
   - Map all affected files
   - Document current patterns
   - Run tests (baseline)
   - Take complexity metrics

2. **Plan Refactoring Steps**
   - Break into phases
   - Order for safety (most isolated first)
   - Plan intermediate states
   - Define verification for each step

3. **Execute Phase 1**
   - Make changes
   - Run tests
   - Commit if pass
   - Rollback if fail

4. **Repeat for Each Phase**
   - Incremental changes only
   - Test after each phase
   - Commit working states
   - Never break main

5. **Final Verification**
   - Full test suite
   - Complexity comparison
   - Performance check
   - Create summary

## Agents Used
- `explorer` (thorough) - Impact analysis
- `architect` - Refactoring strategy
- `pattern-recognition-specialist` - Consistency check
- `code-simplicity-reviewer` - Verify simplification
- `performance-oracle` - Performance impact

## Example
```
/deep/refactor "Extract authentication logic into service layer"
/deep/refactor "Rename 'user' to 'account' across codebase"
/deep/refactor "Convert class components to hooks"
```

## Output Format
```
## Refactoring Plan

### Goal
[What we're improving]

### Current State
- Files affected: [count]
- Current complexity: [score]
- Current test coverage: [X]%

### Phases

#### Phase 1: [Name]
Files:
- [file] - [what changes]

Changes:
- [specific change]

Verification:
- [ ] Tests pass
- [ ] No new warnings
- [ ] Behavior unchanged

Risk: LOW | MED | HIGH

#### Phase 2: [Name]
[Same structure...]

### Safety Measures
- [ ] Baseline tests passing
- [ ] Git worktree for isolation
- [ ] Incremental commits
- [ ] Rollback plan ready

---

## Execution

### Phase 1: [Name] - [STATUS]
Changes applied:
- [file:line] - [change]

Tests: PASS ✓
Committed: [hash]

### Phase 2: [Name] - [STATUS]
[Progress...]

---

## Summary

### Changes Applied
- Files modified: [count]
- Lines changed: +[X] -[Y]
- Commits: [count]

### Metrics Comparison
| Metric | Before | After | Change |
|--------|--------|-------|--------|
| Complexity | [X] | [Y] | -Z% |
| Test coverage | [X]% | [Y]% | +Z% |
| File count | [X] | [Y] | [change] |

### Verification
- [ ] All tests pass
- [ ] No regressions
- [ ] Complexity reduced or same
- [ ] Coverage maintained or improved

### Status: SUCCESS | PARTIAL | FAILED
[If not SUCCESS: what remains]
```

## Quality Gates (Per Phase)
- [ ] Tests pass
- [ ] Linter passes
- [ ] No new warnings
- [ ] Behavior equivalent

## Circuit Breakers
- Any phase fails tests → STOP
- Complexity increases → REVIEW
- Coverage drops → REVIEW
- 3 failed attempts → ESCALATE

## Rules
- Small phases (< 5 files per phase)
- Commit after each successful phase
- Never skip tests
- Use git worktree for isolation
- Preserve behavior unless explicitly changing
- Measure before/after
- Document why, not just what
