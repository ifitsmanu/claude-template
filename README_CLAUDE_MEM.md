# Claude-Mem: Permanently Removed

This template has **completely removed** claude-mem because it violated the "no auto-capture, no pollution" philosophy.

## What Was Done

1. ✅ **Removed from global settings** - Deleted from `~/.claude/settings.json` enabledPlugins
2. ✅ **Removed from marketplace** - Deleted from `~/.claude/plugins/known_marketplaces.json`
3. ✅ **Deleted all data** - Removed `~/.claude-mem/` directory
4. ✅ **Deleted marketplace cache** - Removed `~/.claude/plugins/marketplaces/thedotmack/`
5. ✅ **Git pre-commit hook** - Auto-blocks any CLAUDE.md commits
6. ✅ **Aggressive .gitignore** - Blocks all auto-generated CLAUDE.md files

## Result

Claude-mem hooks will try to run but **fail immediately**:
```
Hook error: Error: Worker did not become ready within 15 seconds. (port 37777)
```

This is GOOD. The plugin is broken and can't store observations. Ignore these errors.

## Why Removed

- **Auto-generated noise** - Created CLAUDE.md files everywhere despite settings
- **Settings ignored** - CLAUDE_MEM_FOLDER_CLAUDEMD_ENABLED: false had no effect
- **Philosophy conflict** - Template is "no auto-capture", claude-mem is "auto-everything"
- **Can't be disabled** - Even with plugin disabled, hooks kept running

## Alternative: Memory MCP Server

Use the memory MCP server instead (manual, opt-in):

```bash
/memory save patterns "API routes follow /api/v1/[resource]"
/memory save decisions "PostgreSQL for ACID transactions"
/memory save learnings "Pool exhaustion = random 500s"
/memory search "auth"
```

Storage: `.claude/memory/` (patterns.md, decisions.md, learnings.md)

## If You Want Claude-Mem Back

**Don't.** But if you must:

```bash
# Re-add to marketplace (from any claude-mem repo)
cd /path/to/claude-mem
claude plugin add .

# Enable globally
# Edit ~/.claude/settings.json
# Add: "claude-mem@thedotmack": true
```

You'll get noise. You've been warned! 🚨
