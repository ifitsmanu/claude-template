# /sprint - Autonomous Feature Loop (Ralph Pattern)

Long-running autonomous loop that implements multiple stories until completion. Based on Ralph pattern - fresh context per iteration, file-based state.

## When to Use
- Multi-story feature implementation
- Well-defined PRD with clear stories
- Tests exist to validate work
- Overnight/background execution

## When NOT to Use
- Single story (overkill)
- Exploratory work (needs human guidance)
- No test suite (quality gates won't work)
- Poorly defined requirements

## Arguments
$ARGUMENTS - Path to PRD file or "init" to create new PRD

## Files

### prd.json (Product Requirements Document)
```json
{
  "name": "Feature Name",
  "branchName": "feature/feature-name",
  "description": "What we're building",
  "userStories": [
    {
      "id": "US-001",
      "title": "Story title",
      "description": "As a [user], I want [goal] so that [benefit]",
      "acceptanceCriteria": [
        "Criterion 1",
        "Criterion 2"
      ],
      "priority": 1,
      "passes": false
    }
  ]
}
```

### progress.txt (Iteration Log)
```
## Codebase Patterns
[Accumulated patterns discovered during sprint]

---

## Iteration 1 - [timestamp]
Story: US-001
Status: SUCCESS
Changes: [list]
Learnings: [what was learned]

---
```

## Process

### Initialization
```
/sprint init
```
Creates template prd.json for you to fill out.

### Execution
```
/sprint .claude/prd/current.json
```

### Per-Iteration Loop
1. **Read prd.json** - Get current state
2. **Check branch** - Checkout/create if needed
3. **Read progress.txt** - Load learnings from previous iterations
4. **Pick story** - Highest priority with `passes: false`
5. **Implement** - Use appropriate agents
6. **Quality gates** - Tests, lint, typecheck must pass
7. **Commit** - If quality gates pass
8. **Update progress.txt** - Append iteration log
9. **Update prd.json** - Mark story `passes: true`
10. **Repeat** - Until all stories pass or max iterations

### Completion
When all stories have `passes: true`:
```
<promise>COMPLETE</promise>
```

## Quality Gates (Per Iteration)
- [ ] Tests pass
- [ ] Lint passes
- [ ] Typecheck passes (if applicable)
- [ ] Story acceptance criteria met

## Example
```
/sprint init                           # Create template PRD
/sprint .claude/prd/current.json       # Run sprint
/sprint --max 5 .claude/prd/current.json  # Limit to 5 iterations
```

## Output Format (Per Iteration)
```
## Sprint Iteration [N]

### Story
- ID: [US-XXX]
- Title: [title]
- Priority: [N]

### Implementation
[What was done]

### Files Changed
- [file] - [change]

### Quality Gates
- Tests: PASS | FAIL
- Lint: PASS | FAIL
- Typecheck: PASS | FAIL

### Status: SUCCESS | FAILED | BLOCKED

### Learnings
[What was learned for future iterations]

---

### Sprint Progress
- Stories completed: [X/Y]
- Iterations used: [N/max]
- Status: CONTINUING | COMPLETE | BLOCKED
```

## Monitoring
```bash
# Check progress
cat .claude/prd/current.json | jq '.userStories[] | {id, title, passes}'

# Check learnings
cat .claude/prd/progress.txt

# Check git history
git log --oneline -10
```

## Circuit Breakers
- Max iterations: 10 (configurable with --max)
- Max time per story: 30 minutes
- Consecutive failures: 3 → STOP

## Rules
- Stories must be small enough to fit one iteration
- Tests MUST pass before marking complete
- Fresh context each iteration (no carried state)
- Document learnings in progress.txt
- Update codebase patterns when discovered
- NEVER skip quality gates
