# Claude Code Template

[![CI](https://github.com/ifitsmanu/claude-template/actions/workflows/ci.yml/badge.svg)](https://github.com/ifitsmanu/claude-template/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Production-ready Claude Code setup. 14 commands, 5 agents, 6 MCP servers. Based on Boris Cherny's workflow.

## Quick Start

**Option 1: GitHub Template** (Recommended)
Click **"Use this template"** → Clone your new repo → Run `claude`

**Option 2: Clone**
```bash
git clone https://github.com/ifitsmanu/claude-template.git my-project
cd my-project
rm -rf .git && git init
```

**Option 3: Copy to existing project**
```bash
cp -r claude-template/.claude your-project/
cp claude-template/CLAUDE.md your-project/
cp -r claude-template/agent_docs your-project/
```

Then run `claude` and say: *"Help me set up CLAUDE.md for this project"*

## What You Get

### Commands (type `/command` in Claude Code)

| Command | Purpose |
|---------|---------|
| `/plan` | Plan features with extended thinking |
| `/fix` | Debug with root cause analysis |
| `/test` | Analyze and improve test coverage |
| `/commit-push-pr` | Full git workflow in one command |
| `/review` | Security + quality code review |
| `/think` | Deep analysis (32k thinking tokens) |
| `/parallel` | Multi-agent parallel implementation |
| `/security` | Security vulnerability scan |
| `/refactor` | Code refactoring |
| `/explore` | Map unfamiliar codebase |
| `/research` | Web research |
| `/browser` | Browser testing with Playwright |
| `/search` | Semantic code search |
| `/commit` | Simple commit |

### Agents (specialized Claude instances)

| Agent | Model | Use case |
|-------|-------|----------|
| `code-reviewer` | Sonnet | Post-implementation security/quality review |
| `code-simplifier` | Sonnet | Remove unnecessary complexity |
| `test-writer` | Haiku | Generate meaningful tests |
| `explorer` | Haiku | Map codebase structure |
| `verify-app` | Haiku | Pre-commit verification |

### MCP Servers (all free)

| Server | What it does |
|--------|-------------|
| `sequential-thinking` | Step-by-step reasoning for complex problems |
| `context7` | Live documentation for any library |
| `exa` | AI-powered semantic web search |
| `jina` | URL to markdown converter |
| `playwright` | Browser automation |
| `filesystem` | Enhanced file operations |

### Hooks (automatic actions)

- **format-on-save** - Auto-format with Prettier/Ruff/gofmt/rustfmt
- **pre-commit** - Run tests + scan for secrets

## Configuration

### Two config files, different purposes:

| File | Shared? | Contains |
|------|---------|----------|
| `.mcp.json` | Yes (commit it) | Team MCP servers |
| `.claude/settings.local.json` | No (gitignored) | Personal API keys, permissions |

Setup:
```bash
cp .claude/settings.local.json.example .claude/settings.local.json
```

### Optional API keys (for premium features):
```bash
export EXA_API_KEY=your-key      # Better search
export JINA_API_KEY=your-key     # More URL reads
```

## The Workflow

Boris Cherny's development loop:

```
/plan → code → /test → code-simplifier → /commit-push-pr
```

Repeat. Ship fast.

## Customization

### Add a command
Create `.claude/commands/deploy.md`:
```markdown
# Deploy

Deploy to: $ARGUMENTS

## Steps
1. Run tests
2. Build
3. Deploy to specified environment
```

### Add an agent
Create `.claude/agents/doc-writer.yml`:
```yaml
name: doc-writer
description: Write documentation
model: haiku
tools: [Read, Edit, Glob]
prompt: |
  You write clear, concise documentation.
  Focus on usage examples over theory.
```

### Configure CLAUDE.md
Fill in your project specifics:
- Tech stack
- Build commands
- Coding conventions
- Forbidden actions

## Recommended Plugins

```bash
# Autonomous long-running tasks
/plugin install ralph-wiggum

# 24 more agents, 13 more commands
/plugin marketplace add https://github.com/kieranklaassen/compound-engineering-plugin
/plugin install compound-engineering
```

## Links

- [PLUGINS.md](PLUGINS.md) - Full MCP installation guide
- [CHANGELOG.md](CHANGELOG.md) - Version history
- [CONTRIBUTING.md](CONTRIBUTING.md) - How to contribute
- [Claude Code Docs](https://docs.anthropic.com/en/docs/claude-code) - Official docs
- [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) - Community resources

## License

MIT
