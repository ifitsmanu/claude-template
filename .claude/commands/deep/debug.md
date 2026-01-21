# /debug - Root Cause Analysis

Deep debugging for mysterious bugs. Combines debugger agent with sequential thinking.

## When to Use
- Bug cause is unclear
- Simple fix didn't work
- Intermittent issues
- Complex system interactions

## When NOT to Use
- Obvious bugs (use `/fix`)
- Known issues with documented fixes
- Performance issues (use performance agent)

## Arguments
$ARGUMENTS - Bug description, symptoms, reproduction steps

## Process

1. **Gather information**
   - Symptoms reported
   - Error messages/logs
   - Reproduction steps
   - Environment details

2. **Form hypotheses** (using sequential-thinking)
   - List possible causes
   - Rate likelihood of each
   - Plan verification approach

3. **Investigate with debugger agent**
   - Trace code paths
   - Check data flow
   - Examine state changes
   - Review logs

4. **Test hypotheses**
   - Verify or eliminate each
   - Update likelihood based on evidence
   - Narrow to root cause

5. **Propose fix**
   - Minimal change to fix root cause
   - Include regression test

6. **Document learning**
   - Save to memory/learnings.md if non-obvious

## Agents
- Primary: `debugger` (Haiku)
- Support: `sequential-thinking` MCP
- Optional: `tester` (for regression test)

## Example
```
/debug "Users randomly get 500 errors during checkout"
/debug "Memory usage keeps growing until OOM crash"
/debug "Data sometimes appears stale despite cache invalidation"
```

## Output Format
```
## Bug Analysis

### Symptoms
- [Observable behavior]
- [Error messages]
- [Frequency/pattern]

### Reproduction
1. [Step]
2. [Step]
Expected: [what should happen]
Actual: [what happens]

### Environment
- [Relevant environment details]

### Investigation Log
[Chronological investigation steps]

### Hypotheses

#### Hypothesis 1: [Description]
- Likelihood: [HIGH/MEDIUM/LOW]
- Evidence for:
  - [Evidence]
- Evidence against:
  - [Evidence]
- Verdict: [CONFIRMED/ELIMINATED/UNCERTAIN]

#### Hypothesis 2: [Description]
[Same structure]

### Root Cause
[file:line] [Detailed explanation]

### Why This Causes the Bug
[Explanation of the failure mechanism]

### Fix
```[language]
[Code change]
```

### Regression Test
```[language]
[Test code]
```

### Learning
[What should be remembered for future debugging]

## Status: SUCCESS | BLOCKED | FAILED
[If BLOCKED: what information is missing]
```

## Rules
- Always find root cause, not just symptoms
- Test hypotheses systematically
- Document investigation for future reference
- Minimal fix - don't refactor
- Add regression test to prevent recurrence
- Save non-obvious learnings to memory
