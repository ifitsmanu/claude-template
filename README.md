# Claude Code Template

[![CI](https://github.com/ifitsmanu/claude-template/actions/workflows/ci.yml/badge.svg)](https://github.com/ifitsmanu/claude-template/actions/workflows/ci.yml)

The best way to set up Claude Code for any project. Based on how Boris Cherny (creator of Claude Code) actually uses it.

## What This Is

A ready-to-use Claude Code configuration with:
- **14 slash commands** for common workflows (planning, testing, committing, code review)
- **5 custom agents** that handle specific tasks (code review, test writing, verification)
- **Auto-formatting hooks** that format your code when Claude edits files
- **6 free MCP servers** pre-configured for search, docs, and browser testing
- **Token-optimized workflows** that save 60%+ on API costs

## Quick Start

### Option 1: Use as GitHub Template (Recommended)
Click the green **"Use this template"** button at the top of this repo.

### Option 2: Clone directly
```bash
git clone https://github.com/ifitsmanu/claude-template.git my-project
cd my-project
rm -rf .git && git init  # Start fresh
```

### Option 3: Copy to existing project
```bash
# Copy the essentials
cp -r /path/to/claude-template/.claude your-project/
cp /path/to/claude-template/CLAUDE.md your-project/
cp -r /path/to/claude-template/agent_docs your-project/
```

## After Copying

1. **Open Claude Code** in your project: `cd your-project && claude`
2. **Ask Claude to configure it**: "Help me set up CLAUDE.md for this project"
3. **That's it.** Claude analyzes your codebase and fills in the details.

## What's Inside

### Slash Commands

These are shortcuts you type in Claude Code. The most useful ones:

| Command | What it does |
|---------|-------------|
| `/plan` | Think through a feature before coding. Uses extended thinking. |
| `/fix` | Fix a bug. Finds root cause, not just symptoms. |
| `/test` | Analyze and improve test coverage. |
| `/commit-push-pr` | Stage, commit, push, and create PR in one go. Boris uses this dozens of times daily. |
| `/review` | Code review focusing on bugs, security, and performance. |
| `/think` | Deep analysis with 32k thinking tokens. For hard problems. |
| `/parallel` | Implement features using multiple agents at once. |

All 14 commands are in `.claude/commands/`. Read them, modify them, add your own.

### Custom Agents

Agents are specialized Claude instances with specific jobs:

| Agent | When to use |
|-------|-------------|
| **code-reviewer** | After writing code. Catches security issues and bugs. Uses Sonnet. |
| **code-simplifier** | After implementation. Removes unnecessary complexity. Uses Sonnet. |
| **test-writer** | When you need tests. Writes meaningful ones, not just coverage padding. Uses Haiku (cheaper). |
| **explorer** | When learning a new codebase. Maps out structure and patterns. Uses Haiku. |
| **verify-app** | Before committing. Runs tests and checks everything works. Uses Haiku. |

Agent configs are in `.claude/agents/`. The `model` field controls cost vs quality.

### MCP Servers

These extend Claude's capabilities. All free, all pre-configured:

| Server | What it does |
|--------|-------------|
| **sequential-thinking** | Helps Claude break down complex problems step by step |
| **context7** | Fetches up-to-date documentation for any library |
| **exa** | AI-powered web search that actually understands code |
| **jina** | Reads any URL and converts to clean markdown |
| **playwright** | Controls a browser for testing and screenshots |
| **filesystem** | File operations (already built into Claude, but more control) |

### MCP Configuration Files

This template includes two MCP config approaches:

| File | Purpose | When to use |
|------|---------|-------------|
| `.mcp.json` | Team-shared config | Commit to git. Everyone gets same MCP servers. |
| `.claude/settings.local.json` | Personal config | Gitignored. Your API keys, extra permissions. |

Copy the example to get started:
```bash
cp .claude/settings.local.json.example .claude/settings.local.json
```

### Hooks

Automatic actions that run when Claude does things:

- **format-on-save**: Runs Prettier/Ruff/gofmt/rustfmt when Claude edits a file
- **pre-commit**: Runs tests and scans for secrets before committing

## Setting Up MCP Servers

The MCP servers work out of the box. For extended features, add API keys:

```bash
# Optional - add to your shell profile
export EXA_API_KEY=your-key
export JINA_API_KEY=your-key
```

## Recommended Plugins

Beyond what's in this template, install these:

### ralph-wiggum
Lets Claude run autonomously for hours. It keeps going until the task is done.
```
/plugin install ralph-wiggum
```

### compound-engineering
24 more agents, 13 more commands. Massive toolkit.
```
/plugin marketplace add https://github.com/kieranklaassen/compound-engineering-plugin
/plugin install compound-engineering
```

## Customizing

### Add your own command
Create `.claude/commands/my-command.md`:
```markdown
# My Command

Do something specific: $ARGUMENTS

## Steps
1. First thing
2. Second thing
```
Use it with `/my-command whatever arguments`

### Add your own agent
Create `.claude/agents/my-agent.yml`:
```yaml
name: my-agent
description: What it does
model: haiku
tools:
  - Read
  - Edit
prompt: |
  You are a specialist at X. Do Y.
```

### Modify CLAUDE.md
This is the most important file. It tells Claude about YOUR project. Fill in:
- Your tech stack
- Your build/test commands
- Your coding rules
- Things Claude should never do

## The Workflow (Boris's Inner Loop)

1. `/plan` - Think through the approach
2. Code it (or `/fix` for bugs)
3. `/test` - Make sure tests pass
4. Run `code-simplifier` agent - Clean up
5. `/commit-push-pr` - Ship it

Repeat. Boris ships 100+ PRs per week this way.

## Resources

- [Boris Cherny's original thread](https://x.com/bcherny/status/2007179832300581177) - How the creator uses Claude Code
- [Claude Code Docs](https://docs.anthropic.com/en/docs/claude-code)
- [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) - Community resources
- [MCP Registry](https://github.com/modelcontextprotocol/servers)
- [PLUGINS.md](PLUGINS.md) - Full MCP installation guide
- [CHANGELOG.md](CHANGELOG.md) - Version history

## Contributing

Found something useful? Add it. PRs welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT
