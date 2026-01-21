# Claude Code Unified Template

[![CI](https://github.com/ifitsmanu/claude-template/actions/workflows/ci.yml/badge.svg)](https://github.com/ifitsmanu/claude-template/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Production-ready Claude Code template synthesizing best practices from [claude-mem](https://github.com/thedotmack/claude-mem), [compound-engineering](https://github.com/EveryInc/compound-engineering-plugin), [ralph](https://github.com/snarktank/ralph), and [sequential-thinking](https://github.com/modelcontextprotocol/servers).

**Philosophy: Complexity is opt-in, not default.**

## Quick Start

```bash
# Clone template
git clone https://github.com/ifitsmanu/claude-template.git my-project
cd my-project && rm -rf .git && git init

# Or copy to existing project
cp -r claude-template/.claude your-project/
cp claude-template/CLAUDE.md your-project/
cp claude-template/.mcp.json your-project/
```

Then run `claude` and start working:

```bash
/fix "button not responding"     # Quick bug fix
/plan "add OAuth authentication" # Plan a feature
/ship                            # Commit + push + PR
```

## What You Get

### 10 Commands (5 Tiers)

| Tier | Commands | Use Case |
|------|----------|----------|
| **Quick** | `/fix`, `/commit`, `/ship` | Zero overhead, just do it |
| **Shallow** | `/review`, `/refactor` | Light analysis |
| **Deep** | `/think`, `/plan`, `/debug` | Sequential thinking (32k tokens) |
| **Parallel** | `/build`, `/parallel` | Multi-agent implementation |
| **Workflow** | `/sprint`, `/memory` | Long-running, persistent |

### 12 Agents (Core + Specialists)

| Core Agents | Model | Responsibility |
|-------------|-------|----------------|
| builder | haiku | Implement code |
| reviewer | sonnet | Judge quality |
| debugger | haiku | Find bugs |
| tester | haiku | Write tests |
| architect | sonnet | Design systems |

| Specialist Agents | Model | Triggers |
|-------------------|-------|----------|
| security | sonnet | `--security`, auth, OWASP |
| performance | sonnet | `--performance`, optimization |
| database | sonnet | migrations, schema |
| frontend | haiku | UI, components |
| backend | haiku | APIs, services |
| ai-engineer | sonnet | LLM, RAG, embeddings |
| designer | sonnet | UX, design system |

### 6 MCP Servers (All Free)

| Server | Purpose |
|--------|---------|
| sequential-thinking | Deep reasoning for `/think`, `/plan` |
| context7 | Real-time library documentation |
| playwright | Browser automation |
| memory | Knowledge graph persistence |
| exa | AI-powered search (freemium) |
| jina | Web content reader (freemium) |

### Selective Memory System

**No auto-capture. No pollution.**

```bash
/memory save patterns "API routes follow /api/v1/[resource]"
/memory save decisions "PostgreSQL for ACID transactions"
/memory save learnings "Pool exhaustion = random 500s at peaks"
/memory search "authentication"
```

### Sprint Mode (Ralph Pattern)

Autonomous loops for multi-story features:

```bash
/sprint init                          # Create PRD template
# Edit .claude/prd/current.json
/sprint .claude/prd/current.json      # Run autonomous loop
```

Fresh context per iteration. File-based state. Quality gates enforced.

## Command Reference

### `/fix` - Quick Bug Fix
```bash
/fix "login button not responding on mobile"
```
Zero overhead. Debugger agent. Direct fix.

### `/think` - Deep Analysis
```bash
/think "how should we migrate to microservices?"
```
32k token budget. Sequential thinking. Branch and revise.

### `/plan` - Feature Planning
```bash
/plan "add OAuth2 with Google and GitHub"
```
Architect agent. Creates implementation plan. Requires approval.

### `/build` - Parallel Implementation
```bash
/build "user profile with avatar" --all
```
Frontend + backend + database + tester in parallel.

### `/review` - Code Review
```bash
/review src/auth/ --security --performance
```
Reviewer agent + optional specialists. Produces verdict.

### `/sprint` - Autonomous Loop
```bash
/sprint .claude/prd/feature.json
```
Implements all stories until complete. Fresh context each iteration.

## Project Structure

```
.claude/
├── agents/
│   ├── core/           # builder, reviewer, debugger, tester, architect
│   └── specialists/    # security, performance, database, frontend, backend, ai-engineer, designer
├── commands/
│   ├── quick/          # fix, commit, ship
│   ├── shallow/        # review, refactor
│   ├── deep/           # think, plan, debug
│   ├── parallel/       # build, parallel
│   └── workflow/       # sprint, memory
├── memory/             # patterns.md, decisions.md, learnings.md
├── prd/                # Sprint PRD templates
├── hooks/              # pre-commit.sh, post-save.sh
├── settings.json       # Safe defaults (commit this)
└── settings.local.json # Dev permissions (gitignored)
```

## Configuration

### Two config files:

| File | Git | Purpose |
|------|-----|---------|
| `.mcp.json` | Commit | Team MCP servers |
| `settings.json` | Commit | Safe base permissions |
| `settings.local.json` | Gitignored | Dev permissions, API keys |

### Setup local config:
```bash
cp .claude/settings.local.json.example .claude/settings.local.json
# Edit with your API keys if desired
```

### Optional API keys:
```bash
export EXA_API_KEY=your-key        # Better search
export JINA_API_KEY=your-key       # More URL reads
export GITHUB_TOKEN=your-token     # GitHub API access
export DATABASE_URL=postgres://... # Database access
```

## Quality Gates

### Pre-Commit (Automatic)
- ✓ Lint passes
- ✓ Tests pass
- ✓ Type check passes
- ✓ No secrets detected

### Agent Status
- `SUCCESS` - Task completed
- `BLOCKED` - Needs human decision
- `FAILED` - Couldn't complete

## Customization

### Add a Command
```markdown
# .claude/commands/quick/deploy.md
# /deploy - Deploy to environment

## When to Use
Deploying to staging or production

## Process
1. Run tests
2. Build
3. Deploy to $ARGUMENTS
```

### Add an Agent
```yaml
# .claude/agents/specialists/devops.yml
name: devops
model: sonnet
tools: [Read, Bash, Grep]
prompt: |
  You are the DEVOPS agent...
```

### Add Memory
```bash
/memory save patterns "Services use repository pattern"
/memory save decisions "Chose Redis for session store: need distributed cache"
```

## Design Principles

1. **Zero overhead by default** - Quick commands work instantly
2. **Opt-in complexity** - Deep thinking only when needed
3. **File-based state** - Git + markdown, no external DBs
4. **Explicit failures** - Agents report BLOCKED/FAILED, never silent
5. **Parallel when possible** - Independent tasks run simultaneously

## What This Template Avoids

Patterns we explicitly rejected:

| Anti-Pattern | Why Rejected |
|--------------|--------------|
| Auto-capture memory | Creates noise, pollutes context |
| 27+ agents | Most overlap, 12 is sufficient |
| Always-on planning | Kills velocity for simple tasks |
| External databases | Adds failure points |
| Silent failures | Masks problems |

## Sources

This template synthesizes:

- **[claude-mem](https://github.com/thedotmack/claude-mem)** → 3-layer retrieval pattern
- **[compound-engineering](https://github.com/EveryInc/compound-engineering-plugin)** → Parallel agents, specialized reviewers
- **[ralph](https://github.com/snarktank/ralph)** → File-based state, iteration loops, AGENTS.md learning
- **[sequential-thinking](https://github.com/modelcontextprotocol/servers)** → Deep analysis for hard problems

## Links

- [CLAUDE.md](CLAUDE.md) - Full command reference
- [PLUGINS.md](PLUGINS.md) - MCP installation guide
- [CONTRIBUTING.md](CONTRIBUTING.md) - How to contribute
- [Claude Code Docs](https://docs.anthropic.com/en/docs/claude-code) - Official docs

## License

MIT
