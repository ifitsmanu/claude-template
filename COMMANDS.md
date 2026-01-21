# Slash Commands Reference

Complete guide to all slash commands available in this Claude Code template.

## Table of Contents
- [Template Commands](#template-commands) (14 custom commands)
- [Ralph-Wiggum Plugin](#ralph-wiggum-plugin) (2 commands)
- [Compound-Engineering Plugin](#compound-engineering-plugin) (13 commands)
- [Quick Reference Matrix](#quick-reference-matrix)

---

## Template Commands

### Quick Tier (Zero Overhead)

#### `/fix` - Quick Bug Fix
**Purpose:** Fast, focused bug resolution without planning overhead.

```bash
/fix "button not responding to clicks"
/fix "authentication failing on production"
```

**What it does:**
- Identifies root cause
- Implements minimal fix
- Runs affected tests
- No formal planning step

**Use when:** Bug is clear, fix is straightforward, urgency is high.

---

#### `/commit` - Safe Commit with Quality Gates
**Purpose:** Commit changes with automatic linting, testing, and secret detection.

```bash
/commit
/commit -m "fix: resolve authentication bug"
```

**Quality gates:**
1. Auto-formats code (prettier, ruff, etc.)
2. Runs linter
3. Executes tests
4. Scans for secrets
5. Blocks commit if any gate fails

**Use when:** Ready to commit, want automatic quality checks.

---

#### `/ship` - Full Release Workflow
**Purpose:** Commit + push + create PR in one command.

```bash
/ship
/ship --draft  # Create draft PR
```

**Workflow:**
1. Runs `/commit` quality gates
2. Pushes to origin
3. Creates GitHub PR with conventional commit message
4. Links related issues

**Use when:** Feature complete, ready for review.

---

### Shallow Tier (Light Analysis)

#### `/review` - Multi-Agent Code Review
**Purpose:** Fast code review with optional deep analysis.

```bash
/review                    # Standard review
/review --security         # Include security agent
/review --performance      # Include performance agent
```

**Agents involved:**
- **reviewer** (always) - Code quality, patterns, clarity
- **security** (optional) - OWASP, vulnerabilities, auth issues
- **performance** (optional) - Bottlenecks, N+1 queries, optimization

**Use when:** Code complete, want quick quality check before merge.

---

#### `/refactor` - Code Simplification
**Purpose:** Simplify code without changing behavior.

```bash
/refactor src/utils/helpers.ts
/refactor "Remove nested conditionals in auth flow"
```

**Focus:**
- Reduce complexity
- Extract functions
- Remove duplication
- Improve naming

**Use when:** Code works but is hard to understand or maintain.

---

### Deep Tier (Sequential Thinking)

#### `/think` - Extended Reasoning (32k tokens)
**Purpose:** Complex problem analysis with deep reasoning.

```bash
/think "Should we use WebSockets or Server-Sent Events for real-time notifications?"
/think "Design a zero-downtime migration strategy for 10M users"
```

**Capabilities:**
- Multi-step reasoning chains
- Trade-off analysis
- Hypothesis testing
- Revises thinking mid-stream

**Token budget:** 32,000 tokens for reasoning
**Use when:** Problem is complex, multiple approaches possible, stakes are high.

---

#### `/plan` - Feature Planning
**Purpose:** Plan implementation before writing code.

```bash
/plan "add OAuth authentication"
/plan "implement real-time collaborative editing"
```

**Output:**
- Step-by-step implementation plan
- File changes required
- Critical decisions highlighted
- Testing strategy

**Use when:** Feature is non-trivial, want alignment before coding.

---

#### `/debug` - Root Cause Analysis
**Purpose:** Systematic debugging with hypothesis testing.

```bash
/debug "Random 500 errors at traffic peaks"
/debug "Memory leak in background worker"
```

**Process:**
1. Reproduce the issue
2. Generate hypotheses
3. Test each hypothesis
4. Identify root cause
5. Propose fix
6. Capture learning

**Use when:** Bug is mysterious, symptoms unclear, standard debugging failed.

---

### Parallel Tier (Multi-Agent)

#### `/build` - Parallel Feature Implementation
**Purpose:** Split large feature across multiple agents working in parallel.

```bash
/build "add user profile pages with avatar upload, bio editing, and activity feed"
```

**How it works:**
- Breaks feature into independent units
- Launches agents in parallel (builder, frontend, backend, tester)
- Each agent works on separate files
- Coordinator merges results
- Reviewer validates integration

**Max agents:** 5 concurrent
**Use when:** Feature has independent components, want faster implementation.

---

#### `/parallel` - Custom Multi-Agent Execution
**Purpose:** Define your own parallel agent workflow.

```bash
/parallel --agents "security,performance,database" --task "Review payment processing system"
```

**Parameters:**
- `--agents` - Comma-separated agent list
- `--task` - Task description
- `--timeout` - Max seconds per agent (default: 300)

**Use when:** Need custom agent combination for specialized analysis.

---

### Workflow Tier (Long-Running)

#### `/memory` - Selective Memory Management
**Purpose:** Manual, opt-in knowledge persistence.

**Subcommands:**

```bash
# Save
/memory save patterns "API routes follow /api/v1/[resource]"
/memory save decisions "PostgreSQL for ACID transactions"
/memory save learnings "Pool exhaustion = random 500s at peaks"

# Search
/memory search "authentication"
/memory search "database connection"

# List
/memory list                    # All categories
/memory list patterns           # Just patterns
/memory list decisions          # Just decisions
/memory list learnings          # Just learnings

# Prune
/memory prune                   # Remove learnings >30 days old
/memory prune --days 60         # Custom retention

# Promote
/memory promote [learning-id]   # Promote learning to pattern
```

**Storage:** `.claude/memory/` (patterns.md, decisions.md, learnings.md)

**Philosophy:** No auto-capture. Save explicitly. Zero pollution.

---

#### `/sprint` - Autonomous Iteration (Ralph Pattern)
**Purpose:** Multi-story feature implementation with autonomous loops.

```bash
# 1. Initialize PRD template
/sprint init

# 2. Edit .claude/prd/current.json with requirements

# 3. Run autonomous loop
/sprint .claude/prd/current.json
```

**How it works:**
- Reads PRD (user stories, acceptance criteria)
- Plans iteration
- Implements features
- Runs tests
- Updates progress.txt
- Loops until PRD complete or max iterations

**State persistence:**
- `progress.txt` - Iteration log
- `prd.json` - Requirements
- Git commits per iteration

**Max iterations:** 50 (configurable)
**Use when:** Multi-story feature, willing to let agent work autonomously.

---

## Ralph-Wiggum Plugin

### `/ralph-loop` - Autonomous Loop Execution
**Purpose:** Continuous autonomous work until task complete.

```bash
/ralph-loop "Build REST API for todos" --max-iterations 20
/ralph-loop "Implement feature X" --completion-promise "DONE"
```

**Parameters:**
- `--max-iterations N` - Safety limit (REQUIRED, recommended)
- `--completion-promise "TEXT"` - Exact string to signal completion

**How it works:**
- You run once
- Claude works on task
- Tries to exit
- Stop hook blocks exit and re-feeds prompt
- Repeats until completion promise or max iterations

**Safety:**
- ALWAYS set `--max-iterations`
- Monitor first few iterations
- Use `/ralph-cancel` if runaway

**Use when:** Task is clear, willing to let agent iterate autonomously.

---

### `/ralph-cancel` - Cancel Active Loop
**Purpose:** Stop the current ralph-loop.

```bash
/ralph-cancel
```

**Use when:** Loop is stuck, going wrong direction, or taking too long.

---

## Compound-Engineering Plugin

### `/deepen-plan` - Enhanced Planning with Research
**Purpose:** Improve existing plan with parallel research agents.

```bash
/deepen-plan
```

**What it does:**
- Takes current plan
- Launches research agents per section
- Adds best practices, patterns, examples
- Enriches with implementation details

**Use when:** Have basic plan, want deeper implementation guidance.

---

### `/changelog` - Generate Engaging Changelogs
**Purpose:** Create user-friendly changelogs from recent merges.

```bash
/changelog
```

**Output:**
- Groups changes by type (features, fixes, breaking)
- User-facing language (no commit jargon)
- Links to PRs and issues
- Engaging descriptions

**Use when:** Ready to cut release, need changelog for users.

---

### `/create-agent-skill` - Skill Creation Wizard
**Purpose:** Create or edit Claude Code skills with guidance.

```bash
/create-agent-skill
```

**Guides you through:**
- Skill structure
- Tool selection
- Prompt engineering
- Best practices
- Testing

**Use when:** Building custom workflow, want skill template.

---

### `/generate_command` - Create Slash Commands
**Purpose:** Generate new slash command following conventions.

```bash
/generate_command
```

**Creates:**
- Command markdown file
- Proper structure
- Usage examples
- Integration with agents

**Use when:** Need custom command for repeated workflow.

---

### `/heal-skill` - Fix Skill Documentation
**Purpose:** Repair incorrect or outdated skill files.

```bash
/heal-skill [skill-name]
```

**Fixes:**
- Wrong tool references
- Outdated API calls
- Missing documentation
- Structure issues

**Use when:** Skill is broken or docs are wrong.

---

### `/plan_review` - Multi-Agent Plan Review
**Purpose:** Parallel review of implementation plans.

```bash
/plan_review
```

**Agents:**
- architect - System design validation
- security - Security implications
- performance - Scalability concerns
- database - Data model review

**Use when:** High-stakes feature, want thorough plan validation.

---

### `/report-bug` - Bug Reporting
**Purpose:** Report issues with the compound-engineering plugin.

```bash
/report-bug
```

**Collects:**
- Steps to reproduce
- Expected vs actual behavior
- System info
- Relevant logs

**Use when:** Plugin is buggy or behaving incorrectly.

---

### `/reproduce-bug` - Bug Investigation
**Purpose:** Reproduce and investigate bugs systematically.

```bash
/reproduce-bug
```

**Process:**
1. Reads logs
2. Inspects console
3. Takes screenshots
4. Reproduces steps
5. Identifies root cause

**Use when:** User reports bug, need to verify and debug.

---

### `/resolve_parallel` - Resolve TODOs in Parallel
**Purpose:** Fix all TODO comments using multiple agents.

```bash
/resolve_parallel
```

**How it works:**
- Finds all TODO/FIXME comments
- Groups by category
- Launches agents per category
- Implements fixes in parallel
- Creates single commit

**Use when:** Many TODOs accumulated, want bulk resolution.

---

### `/resolve_pr_parallel` - Resolve PR Comments
**Purpose:** Address all PR review comments using agents.

```bash
/resolve_pr_parallel
```

**How it works:**
- Fetches PR comments
- Categorizes feedback
- Launches agents per category
- Implements changes
- Marks comments as resolved

**Use when:** PR has many comments, want systematic resolution.

---

### `/resolve_todo_parallel` - Resolve CLI Todos
**Purpose:** Process pending todos from todo list.

```bash
/resolve_todo_parallel
```

**How it works:**
- Reads todo list
- Groups related todos
- Launches agents in parallel
- Marks complete when done

**Use when:** Todo backlog is large, want parallel execution.

---

### `/triage` - Issue Triage and Categorization
**Purpose:** Categorize and prioritize findings for todo system.

```bash
/triage
```

**Categories:**
- P0 - Critical (security, data loss)
- P1 - High (broken features)
- P2 - Medium (bugs, poor UX)
- P3 - Low (cleanup, refactors)

**Use when:** Multiple issues found, need prioritization.

---

### `/test-browser` - PR Browser Testing
**Purpose:** Run browser tests on pages affected by current PR.

```bash
/test-browser
```

**Tests:**
- Visual regression
- Functionality
- Responsiveness
- Accessibility

**Use when:** PR touches UI, want automated browser validation.

---

### `/xcode-test` - iOS Simulator Testing
**Purpose:** Build and test iOS apps on simulator.

```bash
/xcode-test
```

**Runs:**
- XcodeBuild
- Unit tests
- UI tests
- Generates reports

**Use when:** Working on iOS app, need simulator validation.

---

## Quick Reference Matrix

### By Speed

| Speed | Commands | Use Case |
|-------|----------|----------|
| **Instant** | `/fix`, `/commit`, `/ship` | Quick tasks, clear path forward |
| **Fast** | `/review`, `/refactor` | Light analysis, known patterns |
| **Moderate** | `/think`, `/plan`, `/debug` | Complex problems, need reasoning |
| **Slow** | `/build`, `/parallel` | Large features, parallel work |
| **Very Slow** | `/sprint`, `/ralph-loop` | Multi-story features, autonomous loops |

### By Complexity

| Complexity | Commands | Thinking Depth |
|------------|----------|----------------|
| **Simple** | `/fix`, `/commit`, `/review` | Shallow, pattern-based |
| **Moderate** | `/refactor`, `/plan` | Some analysis required |
| **Complex** | `/think`, `/debug` | Deep reasoning (32k tokens) |
| **Very Complex** | `/build`, `/sprint`, `/ralph-loop` | Multi-agent coordination |

### By Use Case

| Use Case | Recommended Command | Alternative |
|----------|---------------------|-------------|
| Bug fix | `/fix` | `/debug` (if mysterious) |
| Code quality | `/review` | `/refactor` (if messy) |
| Feature planning | `/plan` | `/think` (if complex) |
| Feature implementation | `/build` | `/sprint` (multi-story) |
| Autonomous work | `/sprint` | `/ralph-loop` |
| Memory management | `/memory save` | N/A (manual only) |
| Bulk TODOs | `/resolve_parallel` | Manual iteration |
| PR comments | `/resolve_pr_parallel` | Manual resolution |

### By Agent Usage

| Agents | Commands | Parallelization |
|--------|----------|-----------------|
| **0** | `/fix`, `/commit` | N/A |
| **1** | `/review`, `/refactor`, `/think` | Serial |
| **2-3** | `/plan`, `/debug` | Serial with helpers |
| **3-5** | `/build`, `/parallel` | Parallel execution |
| **5+** | `/plan_review`, `/resolve_parallel` | Max parallelization |

---

## Philosophy

This template follows **progressive disclosure**:

1. **Start simple** - Use `/fix` and `/commit` for most work
2. **Add complexity when needed** - Escalate to `/think` or `/plan` for hard problems
3. **Go parallel for speed** - Use `/build` when feature has independent parts
4. **Go autonomous rarely** - Use `/sprint` or `/ralph-loop` only for multi-day features

**Core principle:** Complexity is opt-in, not default.

---

## Sources

- [Compound-Engineering Plugin](https://github.com/EveryInc/compound-engineering-plugin)
- [Ralph-Wiggum Plugin](https://github.com/anthropics/claude-code/tree/main/plugins/ralph-wiggum)
- [Ralph-Wiggum Explained](https://blog.devgenius.io/ralph-wiggum-explained-the-claude-code-loop-that-keeps-going-3250dcc30809)
- [Compound Engineering: How Every Codes With Agents](https://every.to/chain-of-thought/compound-engineering-how-every-codes-with-agents)

---

**Last Updated:** 2026-01-21
