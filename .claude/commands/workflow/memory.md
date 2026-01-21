# /memory - Selective Memory Management

Manage persistent learnings, patterns, and decisions. Opt-in memory - no auto-capture.

## Philosophy
- **Explicit save**: Only save what's valuable
- **No pollution**: Don't capture everything
- **Three categories**: Patterns, Decisions, Learnings
- **File-based**: Git-tracked markdown files

## Memory Files

### patterns.md - Codebase Conventions (Permanent)
```markdown
# Codebase Patterns

## Naming Conventions
- [Pattern]

## Architecture
- [Pattern]

## Testing
- [Pattern]
```

### decisions.md - Architecture Decisions (Permanent)
```markdown
# Architecture Decision Log

## [Date] - [Decision Title]
### Context
[Why was this decision needed?]

### Decision
[What was decided?]

### Rationale
[Why this choice?]

### Consequences
[What are the tradeoffs?]
```

### learnings.md - Iteration Insights (Prunable)
```markdown
# Learnings

## [Date] - [Title]
- Context: [when this applies]
- Learning: [what was learned]
- Tags: [category tags]
```

## Subcommands

### Save
```
/memory save patterns "[pattern description]"
/memory save decisions "[decision with context]"
/memory save learnings "[learning from current work]"
```

### Search
```
/memory search "[query]"
```
Searches all memory files for matching content.

### List
```
/memory list                    # All categories
/memory list patterns           # Just patterns
/memory list decisions          # Just decisions
/memory list learnings          # Just learnings
```

### Prune
```
/memory prune                   # Remove learnings older than 30 days
/memory prune --days 60         # Custom retention period
```

### Promote
```
/memory promote [learning-id]   # Promote learning to pattern
```

## Examples

### Save Pattern
```
/memory save patterns "API routes follow /api/v1/[resource]/[action] naming"
```

### Save Decision
```
/memory save decisions "Using PostgreSQL over MongoDB: need ACID transactions for payments, relational queries for reporting, mature tooling"
```

### Save Learning
```
/memory save learnings "Connection pool exhaustion shows as random 500s at traffic peaks - fix: pool size = workers * 2"
```

### Search
```
/memory search "authentication"
/memory search "database connection"
```

## Output Format

### Save Result
```
## Memory Saved

Category: [patterns|decisions|learnings]
Content: [saved content]
File: [file path]
Line: [line number]

Status: SUCCESS
```

### Search Result
```
## Memory Search: "[query]"

### Patterns
- [matching pattern]

### Decisions
- [matching decision]

### Learnings
- [matching learning]

Total matches: [count]
```

### Prune Result
```
## Memory Pruned

Learnings removed: [count]
Oldest removed: [date]
Remaining learnings: [count]

Status: SUCCESS
```

## Automatic Memory Triggers
These situations should prompt memory save:
- Non-obvious bug fix → learning
- New architectural pattern → pattern
- Technical choice with alternatives → decision
- Repeated mistake → pattern to prevent

## What NOT to Memorize
- Temporary debugging steps
- File contents (git has this)
- Error messages (logs have this)
- Personal preferences (use settings.local.json)
- Obvious patterns (don't state the obvious)

## Rules
- Save explicitly, never auto-capture
- Be concise - future you will thank you
- Include context - when does this apply?
- Prune regularly - old learnings may be stale
- Promote valuable learnings to patterns
