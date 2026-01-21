# Commands Reference

**Philosophy: Leverage plugins. Add only what's missing.**

This template provides 5 focused commands. Everything else comes from plugins.

---

## Quick Start (Use These Daily)

### `/fix` - Quick Bug Fix
```bash
/fix "button not responding to clicks"
```
Fast, focused fix. No planning overhead.

### `/commit` - Safe Commit
```bash
/commit
/commit -m "fix: auth bug"
```
Auto-formats, lints, tests, scans secrets. Blocks bad commits.

### `/ship` - Full Release
```bash
/ship
```
Commits + pushes + creates PR. One command to ship.

---

## Plugin Commands (Compound-Engineering)

### Planning & Design
```bash
/plan "add OAuth"              # Create implementation plan
/think "WebSockets vs SSE?"    # Deep reasoning (32k tokens)
/deepen-plan                   # Enrich plan with research
/plan_review                   # Multi-agent plan validation
```

### Implementation
```bash
/work                          # Execute a plan
/lfg                           # Full autonomous workflow
/resolve_pr_parallel           # Fix all PR comments at once
```

### Code Review
```bash
/review                        # Multi-agent code review
/reproduce-bug                 # Investigate bug systematically
```

### Documentation
```bash
/changelog                     # Generate release changelog
/compound-docs                 # Document solved problems
```

### Bulk Operations
```bash
/resolve_parallel              # Fix all TODOs in parallel
/resolve_todo_parallel         # Process CLI todo list
/triage                        # Categorize findings
```

---

## Autonomous Loops

### `/sprint` - PRD-Based Iteration
```bash
/sprint init                           # Create PRD template
# Edit .claude/prd/current.json
/sprint .claude/prd/current.json       # Run autonomous loop
```
Multi-story features with git-based state. Max 50 iterations.

### `/ralph-loop` - Continuous Work
```bash
/ralph-loop "Build REST API" --max-iterations 20
```
Keeps working until done or max iterations. ALWAYS set limits.

```bash
/ralph-cancel                  # Stop the loop
```

---

## Memory Management

### `/memory` - Manual Knowledge Capture
```bash
# Save (explicit, never auto)
/memory save patterns "API routes follow /api/v1/[resource]"
/memory save decisions "PostgreSQL for ACID guarantees"
/memory save learnings "Pool exhaustion = random 500s"

# Search
/memory search "auth"

# Prune old learnings
/memory prune --days 60
```

Storage: `.claude/memory/` (git-tracked, no pollution)

---

## When to Use What

**Quick bug?** → `/fix`

**Ready to commit?** → `/commit`

**Ship feature?** → `/ship`

**Need a plan?** → `/plan` (or `/think` if complex)

**Implement plan?** → `/work`

**Multi-story feature?** → `/sprint` with PRD

**Full autonomous?** → `/lfg` (use sparingly)

**PR feedback?** → `/resolve_pr_parallel`

**Many TODOs?** → `/resolve_parallel`

**Remember something?** → `/memory save`

---

## Plugin Skills (Auto-Activate)

These activate when you mention trigger phrases:

| Skill | Triggers |
|-------|----------|
| dhh-rails-style | Rails code, "DHH", "37signals" |
| frontend-design | "build component", "create page" |
| agent-browser | "browse website", "screenshot" |
| gemini-imagegen | "generate image", "create logo" |
| rclone | "upload to S3", cloud storage |
| git-worktree | Git worktree operations |

---

## MCP Servers (Always Available)

- **sequential-thinking** - Powers `/think` with 32k token reasoning
- **context7** - Real-time library docs
- **playwright** - Browser automation
- **memory** - Knowledge graph for `/memory` commands
- **Neon** - PostgreSQL management
- **exa** - AI semantic search
- **jina** - Web content reader

---

## Command Count

- **5 Template Commands** - Fix, commit, ship, memory, sprint
- **23 Plugin Commands** - Planning, review, parallel, autonomous
- **14 Plugin Skills** - Auto-activating capabilities
- **3 Ralph Commands** - Loop control

**Total: 45 commands/skills**

Use plugins for heavy lifting. Template fills the gaps.

