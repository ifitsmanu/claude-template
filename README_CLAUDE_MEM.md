# Claude-Mem: Permanently Disabled

This template has **intentionally disabled** the claude-mem plugin because it conflicts with the template's philosophy:

> **"Selective Memory System - No auto-capture. No pollution."**

## Why Disabled

1. **Auto-generated noise** - Creates CLAUDE.md files throughout the repository
2. **Settings not honored** - `CLAUDE_MEM_FOLDER_CLAUDEMD_ENABLED: false` ignored
3. **Automatic behavior** - Conflicts with opt-in philosophy
4. **SessionStart hooks** - Auto-recreates even after deletion

## What We Use Instead

**Memory MCP Server** - Manual, opt-in memory via `/memory` commands:

```bash
/memory save patterns "API routes follow /api/v1/[resource]"
/memory save decisions "PostgreSQL for ACID transactions"
/memory save learnings "Pool exhaustion = random 500s"
/memory search "authentication"
```

Storage: `.claude/memory/` (patterns.md, decisions.md, learnings.md)

## Blocks in Place

1. `~/.claude/settings.json` - claude-mem removed from enabledPlugins
2. `~/.claude-mem/.disabled` - Marker file prevents recreation
3. `.gitignore` - Aggressive patterns block CLAUDE.md files
4. `.git/hooks/pre-commit` - Auto-removes CLAUDE.md commits

## If You Want Claude-Mem

**We don't recommend it**, but if you must:

```bash
# Remove blocks
rm ~/.claude-mem/.disabled
rm -rf ~/.claude-mem

# Edit ~/.claude/settings.json
# Add: "claude-mem@thedotmack": true

# Restart Claude Code
```

But you'll get noise. You've been warned! 🚨
