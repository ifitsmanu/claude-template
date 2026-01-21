# Project: [PROJECT_NAME]

## Stack
- Language: [TypeScript/Python/Go/Rust]
- Framework: [Next.js/FastAPI/Django/etc]
- Database: [PostgreSQL/MongoDB/etc]
- Package Manager: [bun/npm/uv/cargo]

## Structure
src/              # Source code
tests/            # Test files
agent_docs/       # Documentation (load with @agent_docs/file.md)
scripts/          # Build/deploy scripts

## Commands
dev:    [npm run dev / uv run dev]
test:   [npm test / pytest]
lint:   [npm run lint / ruff check]
build:  [npm run build / uv build]

## Rules
1. Run tests before committing
2. Check similar files before creating new ones
3. Keep changes minimal and focused
4. No comments unless logic is non-obvious
5. Prefer editing over creating files

## Forbidden
- Never read .env, secrets.json, *.pem
- Never rm -rf / or git push --force
- Never add deps without approval

## On-Demand Context
@agent_docs/architecture.md  # System design
@agent_docs/api.md           # API reference
@agent_docs/patterns.md      # Code patterns

## Multi-Agent Patterns
- Use Task tool with parallel agents for large searches
- Use subagents for isolated tasks (review, explore, test)
- Chain agents: Plan -> Implement -> Test -> Review
- Each agent gets own context window - use for large codebases

## Context Window Management ⚠️

**Critical:** Your 200k context budget shrinks with excessive tool loading.

### MCP Server Limits
- **Configure:** 20-30 MCPs total maximum
- **Enable:** <10 per project actively
- **Active Tools:** Keep under 80 tools
- **Without limits:** Context drops from 200k → 70k tokens

### Managing Overhead
```json
// In .mcp.json, disable unused servers:
"disabledMcpServers": [
  "playwright",  // Only enable for browser testing
  "exa"          // Only enable for research tasks
]
```

### Best Practices
1. Enable MCPs only when needed for current task
2. Disable after use to reclaim context
3. Monitor context usage in status bar
4. Use fewer, more powerful tools vs many specialized ones

## Quality Gates

### Pre-Commit (Automatic)
- ✓ Tests pass (80% coverage required)
- ✓ Linter passes (zero warnings)
- ✓ Type check passes
- ✓ No secrets detected
- ✓ No console.log in JS/TS files

### Agent Standards
All agents report: `SUCCESS | BLOCKED | FAILED`
- **SUCCESS**: Task completed fully
- **BLOCKED**: Needs human decision
- **FAILED**: Cannot complete, explains why
