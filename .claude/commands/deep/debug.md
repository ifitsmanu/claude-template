# /deep/debug - Systematic Bug Investigation

Deep investigation for complex bugs. Uses thinking tool, git history, logs, and multiple verification passes.

## When to Use
- Root cause unclear
- Intermittent failures
- Production incidents
- Performance degradation
- Complex race conditions

## When NOT to Use
- Obvious bugs (use `/fix`)
- Syntax errors (use `/fix`)
- Simple logic errors (use `/fix`)

## Arguments
$ARGUMENTS - Bug description or reproduction steps

## Process

1. **Reproduce**
   - Set up reproduction case
   - Document exact steps
   - Verify failure consistently

2. **Gather Evidence**
   - Check logs (search for errors)
   - Review recent git history
   - Check related issues/PRs
   - Examine test failures

3. **Hypothesis Formation** (using thinking tool)
   - List possible causes
   - Rate probability of each
   - Design tests for each hypothesis

4. **Binary Search**
   - Git bisect if needed
   - Narrow down suspect code
   - Test each component

5. **Root Cause Analysis**
   - Identify exact failure point
   - Understand why it fails
   - Document conditions needed

6. **Verification**
   - Test fix hypothesis
   - Verify in clean environment
   - Check for regressions

7. **Report**
   - Root cause
   - Fix strategy
   - Prevention recommendations

## Agents Used
- `debugger` - Primary investigation
- `git-history-analyzer` - Find when bug introduced
- `test-writer` - Create reproduction test
- `reviewer` - Validate fix approach

## Example
```
/deep/debug "Users report random 500 errors during checkout"
/deep/debug "Memory leak in worker process after 24h uptime"
/deep/debug --bisect "Feature X broke between v1.2 and v1.3"
```

## Output Format
```
## Bug Investigation Report

### Symptoms
[What users see]

### Reproduction Steps
1. [step]
2. [step]
→ Expected: [behavior]
→ Actual: [behavior]

### Evidence Gathered
- Logs: [summary]
- Git history: [relevant commits]
- Test results: [failures]
- Environment: [details]

### Hypotheses Tested
1. [hypothesis] - Result: CONFIRMED | REJECTED
2. [hypothesis] - Result: CONFIRMED | REJECTED

### Root Cause
[Detailed explanation of why the bug occurs]

File: [file:line]
Introduced in: [commit hash]
Why it wasn't caught: [explanation]

### Fix Strategy
[How to fix it - no code yet]

1. [approach]
   - Pros: [list]
   - Cons: [list]
   - Risk: [LOW|MED|HIGH]

### Recommended Fix
[Chosen approach with justification]

### Prevention
- [ ] Add test for this case
- [ ] Add validation/assertion
- [ ] Update documentation
- [ ] Review similar code

### Ready for Implementation?
YES | NO - [reason if NO]

---
Investigation time: [duration]
```

## Quality Gates
- [ ] Bug reproduced reliably
- [ ] Root cause identified with evidence
- [ ] Fix strategy validated (not just guessed)
- [ ] Regression prevention plan

## Rules
- Don't guess - prove each hypothesis
- Use git bisect for regression hunting
- Document dead ends (save time later)
- Create reproduction test first
- Verify fix in isolation before applying
- Consider cascading effects
