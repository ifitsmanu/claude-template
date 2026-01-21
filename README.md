# Claude Code Unified Template

[![CI](https://github.com/ifitsmanu/claude-template/actions/workflows/ci.yml/badge.svg)](https://github.com/ifitsmanu/claude-template/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Production-ready Claude Code template synthesizing best practices from [claude-mem](https://github.com/thedotmack/claude-mem), [compound-engineering](https://github.com/EveryInc/compound-engineering-plugin), [ralph](https://github.com/snarktank/ralph), [sequential-thinking](https://github.com/modelcontextprotocol/servers), and [everything-claude-code](https://github.com/affaan-m/everything-claude-code).

**Philosophy: Complexity is opt-in, not default.**

## ⚡ Latest Enhancements (2026-01-21)

Adopted 15+ battle-tested patterns from [everything-claude-code](https://github.com/affaan-m/everything-claude-code):
- 🎯 **Rules System** - Enforceable quality gates (80% coverage, OWASP Top 10, code standards)
- 🪝 **Advanced Hooks** - 9 hooks across all 5 lifecycle events (prevent errors before they happen)
- ⚠️ **Context Window Mgmt** - Critical warnings about MCP overhead (200k → 70k with 20+ servers)
- 🎓 **Skills System** - Reusable workflows (TDD guide with RED→GREEN→IMPROVE cycle)
- 🧪 **Enhanced Testing** - E2E specialist agent, mandatory coverage, TDD enforcement

See [IMPROVEMENTS.md](IMPROVEMENTS.md) for complete details.

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

### 5 Core Commands + 40 Plugin Commands

**Template Commands (Use Daily):**
- `/fix` - Quick bug fixes
- `/commit` - Safe commits with quality gates
- `/ship` - Full release (commit + push + PR)
- `/memory` - Manual knowledge capture
- `/sprint` - PRD-based autonomous iteration

**Plugin Commands:**
- 23 from compound-engineering (/plan, /think, /review, /work, /lfg, etc.)
- 14 auto-activating skills (frontend-design, dhh-rails-style, etc.)
- 3 from ralph-wiggum (/ralph-loop for continuous work)

See [COMMANDS.md](COMMANDS.md) for complete reference.

### 13 Agents (Core + Specialists)

| Core Agents | Model | Responsibility |
|-------------|-------|----------------|
| builder | haiku | Implement code |
| reviewer | sonnet | Judge quality |
| debugger | haiku | Find bugs |
| tester | haiku | Write tests (80% coverage required) |
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
| e2e-runner | haiku | Playwright E2E tests (NEW) |

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
├── rules/ (NEW)        # testing.md, security.md, quality.md, agent-delegation.md
├── skills/ (NEW)       # tdd-guide.md (RED→GREEN→IMPROVE workflow)
├── agents/
│   ├── core/           # builder, reviewer, debugger, tester, architect
│   └── specialists/    # security, performance, database, frontend, backend, ai-engineer, designer, e2e-runner
├── commands/
│   ├── quick/          # fix, commit, ship
│   ├── deep/           # analyze, plan, debug, refactor
│   └── parallel/       # implement, research
├── memory/             # patterns.md, decisions.md, learnings.md
├── prd/                # Sprint PRD templates
├── hooks/              # 9 hooks across 5 lifecycle events
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
- ✓ Tests pass (**80% coverage required**)
- ✓ Lint passes (zero warnings)
- ✓ Type check passes
- ✓ No secrets detected (OWASP checks)
- ✓ No console.log in JS/TS files

### Agent Status (Standardized)
All agents report: `SUCCESS | BLOCKED | FAILED`
- `SUCCESS` - Task completed fully
- `BLOCKED` - Needs human decision
- `FAILED` - Cannot complete, explains why

### Quality Rules (NEW)
- 📋 Testing: 80% coverage, TDD workflow, 3 test types required
- 🔒 Security: OWASP Top 10 compliance, secrets scanning
- 📝 Code Quality: Functions <50 lines, nesting <3 levels
- 🤝 Agent Delegation: Clear rules on when to use which agent

See `.claude/rules/` for complete standards.

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
- **[everything-claude-code](https://github.com/affaan-m/everything-claude-code)** → Rules system, advanced hooks, skills, context management (10+ months production-tested)

## Links

- [IMPROVEMENTS.md](IMPROVEMENTS.md) - Latest enhancements (2026-01-21)
- [CLAUDE.md](CLAUDE.md) - Project instructions and context window warnings
- [COMMANDS.md](COMMANDS.md) - Complete command reference
- [PLUGINS.md](PLUGINS.md) - MCP installation guide with overhead warnings
- [CONTRIBUTING.md](CONTRIBUTING.md) - How to contribute
- [Claude Code Docs](https://docs.anthropic.com/en/docs/claude-code) - Official docs

## License

MIT
