# Complete Command Reference

One file to rule them all. Fast reference for every command in the system.

## ⚡ Enhanced with New Standards (2026-01-21)

All commands now enforce:
- 📋 **80% test coverage** (testing.md rule)
- 🔒 **OWASP Top 10 compliance** (security.md rule)  
- 📝 **Code quality standards** (quality.md rule)
- 🤝 **Agent delegation rules** (agent-delegation.md rule)
- 🎓 **TDD workflow** for new features (tdd-guide skill)

See `.claude/rules/` for complete standards.

## Quick Reference Table

| Command | Type | Time | Purpose |
|---------|------|------|---------|
| `/commit` | Quick | 30-60s | Stage, test, commit |
| `/fix` | Quick | 1-2m | Fix obvious bugs |
| `/ship` | Quick | 1-2m | Commit + push + PR |
| `/deep/analyze` | Deep | 5-15m | Codebase analysis |
| `/deep/debug` | Deep | 10-30m | Root cause investigation |
| `/deep/plan` | Deep | 5-20m | Implementation planning |
| `/deep/refactor` | Deep | 20-60m | Safe large refactoring |
| `/parallel/test` | Parallel | varies | Concurrent test suites |
| `/parallel/review` | Parallel | 3-5m | Multi-agent code review |
| `/parallel/research` | Parallel | 2-5m | Multi-source research |
| `/parallel/implement` | Parallel | varies | Parallel feature work |
| `/memory` | Workflow | instant | Manage learnings |
| `/sprint` | Workflow | hours | Autonomous feature loop |

---

## QUICK COMMANDS - Fast Single Actions

### /commit - Safe Commit
**Stage, lint, test, and commit. Blocks if quality gates fail.**

```bash
/commit "feat: add user authentication"
/commit  # Auto-generates message from changes
```

**Process:**
1. Stage all changes (`git add -A`)
2. Run linter (if available)
3. Run tests (if available)
4. Check for secrets in diff
5. Commit with conventional message

**Quality Gates (MUST PASS):**
- ✓ Tests pass with **80% coverage**
- ✓ Linting passes (zero warnings)
- ✓ Type check passes
- ✓ No secrets detected (OWASP checks)
- ✓ No console.log in JS/TS files

**Blocks if:** Any quality gate fails

**Rules Enforced:**
- testing.md (80% coverage requirement)
- security.md (secrets detection)
- quality.md (lint standards)

---

### /fix - Quick Bug Fix
**Zero-overhead command for obvious bugs. No planning, just fix it.**

```bash
/fix "login button not responding on mobile"
```

**When to use:**
- Bug cause is obvious
- Fix is straightforward
- No architectural implications

**When NOT to use:**
- Root cause unclear → use `/deep/debug`
- Fix requires design → use `/deep/plan`

**Process:**
1. Locate the bug
2. Make minimal changes
3. Verify with tests
4. Report changes

**Agent:** `debugger` (Haiku - fast)

---

### /ship - Full Release Workflow
**Commit, push, and create PR in one command.**

```bash
/ship "Add user authentication with OAuth"
/ship  # Auto-generates PR from commits
```

**Process:**
1. Run `/commit` (includes all quality gates)
2. Push to remote
3. Create Pull Request (uses `gh` CLI if available)

**Prerequisites:**
- Git remote configured
- Optional: `gh` CLI for auto-PR creation

---

## DEEP COMMANDS - Thorough Investigation

### /deep/analyze - Codebase Analysis
**Comprehensive analysis of architecture, patterns, and technical debt.**

```bash
/deep/analyze                    # Full analysis
/deep/analyze architecture       # Focus on architecture
/deep/analyze debt              # Technical debt only
/deep/analyze security          # Security-focused
```

**When to use:**
- Understanding unfamiliar codebase
- Pre-refactor assessment
- Technical debt audit
- Architecture documentation

**Process:**
1. Map structure and components
2. Extract patterns and conventions
3. Assess quality and complexity
4. Security and performance scan
5. Generate comprehensive report

**Agents:** `explorer` (thorough), `architect`, `security`, `performance`

**Output:** `.claude/reports/analysis-[timestamp].md`

---

### /deep/debug - Root Cause Investigation
**Systematic investigation for complex bugs with evidence gathering.**

```bash
/deep/debug "Users report random 500 errors during checkout"
/deep/debug "Memory leak in worker after 24h uptime"
/deep/debug --bisect "Feature X broke between v1.2 and v1.3"
```

**When to use:**
- Root cause unclear
- Intermittent failures
- Production incidents
- Performance degradation
- Complex race conditions

**Process:**
1. Reproduce consistently
2. Gather evidence (logs, git history, tests)
3. Form hypotheses (using thinking tool)
4. Binary search (git bisect if needed)
5. Root cause analysis
6. Verification and fix strategy

**Agents:** `debugger`, `git-history-analyzer`, `test-writer`

**Quality Gates:**
- ✓ Bug reproduced reliably
- ✓ Root cause identified with evidence
- ✓ Fix strategy validated

---

### /deep/plan - Implementation Planning
**Creates comprehensive plan with research, dependencies, and risk assessment.**

```bash
/deep/plan "Add OAuth authentication with Google and GitHub"
/deep/plan "Migrate from REST to GraphQL"
/deep/plan "Implement real-time collaboration"
```

**When to use:**
- Complex feature implementation
- Major refactoring
- Architecture changes
- Multiple file changes
- High-risk modifications

**Process:**
1. Requirements analysis
2. Research phase (parallel agents)
   - Search codebase patterns
   - Research framework best practices
   - Check similar implementations
3. Dependency mapping
4. Risk assessment (security, performance, breaking changes)
5. Step-by-step plan
6. User approval required

**Agents:** `explorer` (thorough), `architect`, `best-practices-researcher`, `framework-docs-researcher`, `pattern-recognition-specialist`

**User Approval:** Plan must be explicitly approved before implementation

---

### /deep/refactor - Safe Large-Scale Refactoring
**Plan and execute refactoring with safety checks and phased commits.**

```bash
/deep/refactor "Extract authentication logic into service layer"
/deep/refactor "Rename 'user' to 'account' across codebase"
/deep/refactor "Convert class components to hooks"
```

**When to use:**
- Multi-file refactoring
- Renaming across codebase
- Extracting abstractions
- Restructuring modules
- Pattern enforcement

**Process:**
1. Analyze current state (baseline tests and metrics)
2. Plan refactoring phases
3. Execute phase by phase
   - Make changes
   - Run tests
   - Commit if pass
   - Rollback if fail
4. Final verification with metrics comparison

**Agents:** `explorer` (thorough), `architect`, `pattern-recognition-specialist`, `code-simplicity-reviewer`, `performance-oracle`

**Quality Gates (per phase):**
- ✓ Tests pass
- ✓ Linter passes
- ✓ No new warnings
- ✓ Behavior unchanged

**Circuit Breakers:**
- Any phase fails → STOP
- Complexity increases → REVIEW
- Coverage drops → REVIEW

---

## PARALLEL COMMANDS - Concurrent Execution

### /parallel/test - Parallel Test Execution
**Run multiple test suites concurrently with aggregated results.**

```bash
/parallel/test                                    # Auto-detect all suites
/parallel/test "npm test && npm run test:e2e"   # Explicit commands
/parallel/test .claude/test-config.json          # From config
```

**When to use:**
- Multiple test suites exist
- Integration + unit tests
- Different test frameworks
- Speed up test execution

**Config format:**
```json
{
  "suites": [
    {
      "name": "Unit Tests",
      "command": "npm test",
      "timeout": 30000
    },
    {
      "name": "E2E Tests",
      "command": "npm run test:e2e",
      "timeout": 120000
    }
  ]
}
```

**Speedup:** 1.5-3x vs sequential

---

### /parallel/review - Multi-Agent Code Review
**Launch 4-6 specialized review agents simultaneously for comprehensive review.**

```bash
/parallel/review              # Review current changes
/parallel/review src/auth    # Review specific directory
/parallel/review --pr 123    # Review specific PR
```

**When to use:**
- Pre-merge review
- Large PR
- Critical code paths
- Security-sensitive changes
- Performance-critical code

**Review Agents (parallel):**
- `security-sentinel` - Security vulnerabilities
- `performance-oracle` - Performance analysis
- `code-simplicity-reviewer` - Complexity check
- `pattern-recognition-specialist` - Pattern consistency
- `data-integrity-guardian` - Data safety (if migrations)
- `agent-native-reviewer` - Agent accessibility (if API changes)

**Output:** Findings aggregated by severity (CRITICAL → HIGH → MEDIUM → LOW → INFO)

**Time:** 3-5 minutes (vs ~15-20 minutes sequential)

---

### /parallel/research - Multi-Source Research
**Launch multiple research queries using Exa, Context7, web search, and codebase analysis.**

```bash
/parallel/research "How to implement OAuth with Next.js"
/parallel/research "Best practices for PostgreSQL connection pooling"
/parallel/research "Redis vs in-memory cache for session storage"
/parallel/research "OAuth Next.js; PostgreSQL pooling; Redis vs Memcached"
```

**When to use:**
- Unfamiliar technology
- Framework selection
- Architecture decisions
- Multiple unknowns

**Research Tools (parallel execution):**

1. **Exa Code Context** - Code examples, API usage (1000-50000 tokens)
2. **Context7** - Official framework documentation
3. **Exa Web Search** - Comprehensive web research (fast/auto/deep modes)
4. **Exa Company Research** - Business intelligence
5. **Codebase Search** - Grep/Glob for existing patterns
6. **WebSearch** - Fallback general search

**Output:** Synthesized report with:
- Executive summary
- Official documentation (HIGH reliability)
- Code examples from multiple sources
- Codebase patterns (HIGH reliability)
- Best practices (MEDIUM-HIGH reliability)
- Comparison tables
- Clear recommendations
- All sources cited with URLs

**Speedup:** 3-5x vs sequential research

**Agent:** `researcher` with multi-tool access

---

### /parallel/implement - Parallel Feature Implementation
**Implement multiple independent features concurrently using separate agents.**

```bash
/parallel/implement "Add dark mode; Add user profile; Fix email validation"
/parallel/implement tasks.json
```

**When to use:**
- Multiple independent features
- No shared dependencies
- Time-sensitive delivery
- Well-defined requirements

**When NOT to use:**
- Features depend on each other
- Shared files need coordination
- Requirements unclear

**Task file format:**
```json
{
  "tasks": [
    {
      "id": "task-1",
      "title": "Add dark mode toggle",
      "priority": "high",
      "files": ["src/components/Navbar.tsx"]
    }
  ]
}
```

**Process:**
1. Parse tasks and check dependencies
2. Launch parallel agents (one per task)
3. Separate git worktrees for isolation
4. Monitor progress
5. Merge results and run combined tests

**Speedup:** 1.3-2x vs sequential

**Safety:** Git worktrees for isolation, combined testing mandatory

---

## WORKFLOW COMMANDS - Long-Running Processes

### /memory - Selective Memory Management
**Manage persistent learnings, patterns, and decisions. Opt-in, no auto-capture.**

```bash
# Save
/memory save patterns "API routes follow /api/v1/[resource]/[action]"
/memory save decisions "Using PostgreSQL over MongoDB: need ACID transactions"
/memory save learnings "Pool exhaustion shows as random 500s - fix: pool size = workers * 2"

# Search
/memory search "authentication"
/memory search "database connection"

# List
/memory list                 # All categories
/memory list patterns       # Just patterns
/memory list learnings      # Just learnings

# Prune
/memory prune               # Remove learnings >30 days
/memory prune --days 60     # Custom retention

# Promote
/memory promote [learning-id]   # Learning → Pattern
```

**Memory Files:**
- `patterns.md` - Codebase conventions (permanent)
- `decisions.md` - Architecture decisions (permanent)
- `learnings.md` - Iteration insights (prunable)

**Philosophy:** Explicit save, no pollution, git-tracked

---

### /sprint - Autonomous Feature Loop
**Long-running autonomous loop implementing multiple stories until completion.**

```bash
/sprint init                         # Create template PRD
/sprint .claude/prd/current.json     # Run sprint
/sprint --max 5 .claude/prd/current.json  # Limit iterations
```

**When to use:**
- Multi-story feature implementation
- Well-defined PRD with clear stories
- Tests exist to validate work
- Overnight/background execution

**When NOT to use:**
- Single story (overkill)
- Exploratory work (needs human guidance)
- No test suite
- Poorly defined requirements

**Files:**
- `prd.json` - Product requirements with user stories
- `progress.txt` - Iteration log with learnings

**Per-Iteration Loop:**
1. Read PRD for current state
2. Read progress.txt for learnings
3. Pick highest priority story with `passes: false`
4. Implement using appropriate agents
5. Quality gates (tests, lint, typecheck)
6. Commit if gates pass
7. Update progress.txt
8. Mark story `passes: true`
9. Repeat until all stories pass

**Quality Gates (per iteration):**
- ✓ Tests pass
- ✓ Lint passes
- ✓ Typecheck passes
- ✓ Acceptance criteria met

**Circuit Breakers:**
- Max iterations: 10 (configurable)
- Max time per story: 30 minutes
- Consecutive failures: 3 → STOP

---

## Decision Tree

### Starting a Task
```
Obvious fix?
├─ YES → /fix
└─ NO → Well-defined?
    ├─ YES → /deep/plan
    └─ NO → /deep/analyze first
```

### Investigating a Bug
```
Cause obvious?
├─ YES → /fix
└─ NO → /deep/debug
```

### Before Merging
```
1. /parallel/test      # Verify all tests
2. /parallel/review    # Comprehensive review
3. /ship              # If gates pass
```

### Research & Implement
```
1. /parallel/research "[questions]"
2. /deep/plan "[approach]"
3. /parallel/implement "[tasks]"  # If independent
   OR sequential if dependent
4. /parallel/review
5. /ship
```

---

## Common Combinations

### Feature Development
```
/parallel/research → /deep/plan → /parallel/implement → /parallel/review → /ship
```

### Bug Fix
```
/deep/debug → /fix OR /deep/plan → /parallel/test → /commit
```

### Codebase Onboarding
```
/deep/analyze → /memory save patterns → /parallel/research
```

### Major Refactoring
```
/deep/analyze → /deep/plan → /deep/refactor → /parallel/test → /parallel/review
```

---

## Quality Gates Summary

| Command | Gates |
|---------|-------|
| `/commit` | Tests, lint, no secrets |
| `/ship` | All /commit gates |
| `/parallel/test` | All suites pass |
| `/deep/refactor` | Tests per phase |
| `/parallel/review` | Critical issues block |
| `/deep/plan` | User approval required |
| `/sprint` | Per-iteration gates |

---

## Performance & Cost

| Type | Token Cost | Speed | Use Case |
|------|-----------|-------|----------|
| Quick | Low | Fast (1-2m) | Obvious actions |
| Deep | High | Slow (5-60m) | Complex decisions |
| Parallel | Very High | Fast (2-5m) | Multiple tasks |
| Workflow | Med/turn | Varies | Long-running |

---

## Best Practices

### DO
- Use quick commands for obvious tasks
- Use deep commands when uncertain
- Use parallel commands for speed
- Run /parallel/review before merge
- Save important discoveries to /memory
- Use /sprint for multi-story work

### DON'T
- Use /fix for complex bugs (use /deep/debug)
- Skip tests in /commit (never bypass)
- Run /parallel/implement with dependencies
- Forget to save patterns to memory

---

## Research Tool Selection

| Question | Primary | Secondary | Tertiary |
|----------|---------|-----------|----------|
| "How to [code]" | Exa Code | Context7 | Grep |
| "[Lib] docs" | Context7 | Exa Code | WebFetch |
| "Best practices" | Exa Web | Context7 | WebSearch |
| "Compare X vs Y" | Exa Web | Exa Code | Grep |
| "Company info" | Exa Company | Exa Web | WebSearch |

---

**Last Updated:** 2026-01-21
**Total Commands:** 13 (3 quick, 4 deep, 4 parallel, 2 workflow)
