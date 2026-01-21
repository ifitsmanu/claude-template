# /parallel/implement - Parallel Feature Implementation

Implement multiple independent features or tasks concurrently using separate agents. Faster than sequential for independent work.

## When to Use
- Multiple independent features
- Parallelizable tasks
- No shared dependencies
- Time-sensitive delivery
- Well-defined requirements

## When NOT to Use
- Features depend on each other
- Shared files need coordination
- Requirements unclear
- High risk of conflicts

## Arguments
$ARGUMENTS - Tasks to implement (separated by semicolons) or path to task list file

## Process

1. **Parse Tasks**
   - Extract each task
   - Check for dependencies
   - Assign complexity

2. **Dependency Analysis**
   - Identify shared files
   - Map data flow
   - Warn about conflicts

3. **Launch Parallel Agents**
   - One agent per independent task
   - Separate git worktrees
   - Background execution

4. **Monitor Progress**
   - Track completion status
   - Capture outputs
   - Check for errors

5. **Integration**
   - Merge results
   - Resolve conflicts
   - Combined testing

## Example
```
/parallel/implement "Add dark mode toggle; Add user profile page; Fix email validation"
/parallel/implement tasks.json
```

## Task File Format
```json
{
  "tasks": [
    {
      "id": "task-1",
      "title": "Add dark mode toggle",
      "description": "Add theme switcher to navbar",
      "priority": "high",
      "files": ["src/components/Navbar.tsx", "src/styles/theme.ts"]
    },
    {
      "id": "task-2",
      "title": "Add user profile page",
      "description": "Create /profile route with user info",
      "priority": "medium",
      "files": ["src/pages/profile.tsx", "src/api/user.ts"]
    }
  ]
}
```

## Output Format
```
## Parallel Implementation

### Tasks Detected
1. [task-1] Add dark mode toggle - Priority: HIGH
2. [task-2] Add user profile page - Priority: MEDIUM
3. [task-3] Fix email validation - Priority: LOW

### Dependency Analysis
✓ No blocking dependencies detected
⚠️ Shared file detected: src/styles/theme.ts
  - Used by: task-1, task-2
  - Strategy: Sequential merge

### Execution Plan
**Parallel Group 1:** (independent)
- task-1: Dark mode toggle
- task-3: Email validation

**Sequential After:** (depends on Group 1)
- task-2: User profile page

### Agent Launch
┌─────────┬──────────────────┬────────┬───────────┐
│ Task ID │ Agent            │ Status │ Worktree  │
├─────────┼──────────────────┼────────┼───────────┤
│ task-1  │ builder (sonnet) │ 🟢 RUN │ wt-task-1 │
│ task-3  │ builder (haiku)  │ 🟢 RUN │ wt-task-3 │
└─────────┴──────────────────┴────────┴───────────┘

---

## Progress Updates

### task-1: Dark mode toggle - ✓ COMPLETE (3.2 min)

**Changes:**
- src/components/Navbar.tsx - Added theme switcher
- src/styles/theme.ts - Added dark theme config
- src/hooks/useTheme.ts - NEW - Theme hook

**Tests:** ✓ PASS (12/12)
**Commit:** a1b2c3d

---

### task-3: Email validation - ✓ COMPLETE (1.8 min)

**Changes:**
- src/utils/validation.ts - Fixed email regex
- src/components/LoginForm.tsx - Added validation

**Tests:** ✓ PASS (8/8)
**Commit:** e4f5g6h

---

### task-2: User profile page - 🟡 IN PROGRESS

**Status:** Implementing after task-1 completion
[Real-time updates...]

---

## Integration

### Merging Results
1. Merge task-1 (no conflicts)
2. Merge task-3 (no conflicts)
3. Merge task-2 (resolved theme.ts conflict)

### Combined Testing
Running full test suite...
✓ All tests pass (45/45)

### Final Changes
| File | Tasks | Status |
|------|-------|--------|
| src/components/Navbar.tsx | task-1 | ✓ |
| src/styles/theme.ts | task-1, task-2 | ✓ merged |
| src/pages/profile.tsx | task-2 | ✓ |
| src/utils/validation.ts | task-3 | ✓ |

---

## Summary

### Completed Tasks: 3/3

**Total Time:** 8.4 minutes (parallel)
**vs Sequential:** ~12.3 minutes estimated
**Speedup:** 1.46x

### Commits Created
- a1b2c3d - feat: add dark mode toggle
- e4f5g6h - fix: email validation regex
- i7j8k9l - feat: add user profile page

### Test Results
- Unit tests: 45/45 ✓
- Integration tests: 12/12 ✓
- Coverage: 82.3% (+3.1%)

### Files Changed
- Modified: 5
- Created: 2
- Total lines: +342 / -128

---

## Quality Gates
- [x] All tests pass
- [x] No lint errors
- [x] Coverage maintained
- [x] No conflicts in final merge

## Status: SUCCESS | PARTIAL | FAILED
[If not SUCCESS: which tasks failed and why]
```

## Conflict Resolution Strategy

### No Conflicts
- Merge all branches
- Run combined tests
- Commit as one or separate

### Minor Conflicts
- Auto-resolve if safe
- Manual review for edge cases
- Re-test after merge

### Major Conflicts
- Stop parallel execution
- Switch to sequential
- Present conflict to user

## Agent Assignment
- High complexity → Sonnet agent
- Medium complexity → Sonnet agent
- Low complexity → Haiku agent
- Adjust based on task requirements

## Safety Measures
- Git worktrees for isolation
- Separate test runs
- Conflict detection
- Combined test suite at end
- Rollback on failure

## Quality Gates (Per Task)
- [ ] Tests pass in isolation
- [ ] Lint passes
- [ ] No new warnings
- [ ] Acceptance criteria met

## Quality Gates (Integration)
- [ ] All tasks complete
- [ ] Combined tests pass
- [ ] No merge conflicts or resolved
- [ ] Coverage maintained

## Rules
- Max 3 parallel tasks at once
- Independent tasks only
- File conflict → sequential merge
- Combined testing mandatory
- Each task in separate worktree
- Clean up worktrees after
- Commit per task, not combined
