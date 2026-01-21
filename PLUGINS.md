# Plugin & MCP Installation Guide

Complete guide to MCP servers and plugins for the unified Claude Code template.

## Quick Setup

The template includes `.mcp.json` with essential servers pre-configured. Just run `claude` and they'll be available.

For additional servers or API key configuration, add to `.claude/settings.local.json`.

---

## TIER 1: Essential (Pre-Configured)

These servers are included in `.mcp.json` and work without API keys.

### Sequential Thinking - Deep Reasoning
```bash
# Already in .mcp.json, or add manually:
claude mcp add sequential-thinking -s user -- npx -y @modelcontextprotocol/server-sequential-thinking
```
**Used by:** `/think`, `/plan`, `/debug`
**Purpose:** Step-by-step reasoning, branching logic, hypothesis testing

### Context7 - Real-Time Library Documentation
```bash
# Already in .mcp.json, or add manually:
claude mcp add context7 -s user -- npx -y @upstash/context7-mcp@latest
```
**Used by:** `/plan`, research tasks
**Purpose:** Up-to-date API docs for 100+ frameworks

### Playwright - Browser Automation
```bash
# Already in .mcp.json, or add manually:
claude mcp add playwright -s user -- npx -y @playwright/mcp@latest
```
**Used by:** `/browser`, designer agent, UI verification
**Purpose:** Screenshots, form filling, E2E testing

### Memory - Knowledge Graph
```bash
# Already in .mcp.json, or add manually:
claude mcp add memory -s user -- npx -y @modelcontextprotocol/server-memory
```
**Used by:** `/memory` command, cross-session persistence
**Purpose:** Entities, relations, facts that persist

---

## TIER 2: Search & Research (Freemium)

Work without API keys but enhanced with them.

### Exa - AI-Powered Search
```bash
claude mcp add exa -s user -- npx -y exa-mcp-server
# Optional: export EXA_API_KEY=your-key
```
**Tools:**
- `web_search_exa` - Semantic search with AI understanding
- `get_code_context_exa` - Find code examples, GitHub repos

### Jina AI - Web Reader
```bash
claude mcp add jina -s user -- npx -y jina-mcp
# Optional: export JINA_API_KEY=your-key
```
**Tools:**
- `read_url` - Any URL to clean markdown
- `parallel_read_url` - Batch fetch
- `web_search` - SERP results

### mgrep - Semantic Code Search
```bash
# Install mgrep CLI
cargo install mgrep
# Or via npm
npm install -g mgrep-cli

# Usage
mgrep "Where is auth middleware?"
mgrep --web "How to implement OAuth2"
```
**Benefit:** 2x fewer tokens than grep workflows

---

## TIER 3: Development Tools (Requires Config)

### GitHub - PR/Issue Management
```bash
claude mcp add github -s user -- npx -y @modelcontextprotocol/server-github
```
**Requires:** `GITHUB_TOKEN` environment variable
```bash
export GITHUB_TOKEN=ghp_xxxxxxxxxxxx
```

### PostgreSQL - Database Access
```bash
claude mcp add postgres -s user -- npx -y @modelcontextprotocol/server-postgres
```
**Requires:** `DATABASE_URL` environment variable
```bash
export DATABASE_URL=postgresql://user:pass@localhost/db
```

### Filesystem - Enhanced File Operations
```bash
claude mcp add filesystem -s user -- npx -y @modelcontextprotocol/server-filesystem .
```
**Provides:** Advanced file operations beyond built-in tools

### Neon - Serverless Postgres
```bash
claude mcp add neon -s user -- npx -y @neondatabase/mcp-server-neon
```
**Requires:** `NEON_API_KEY` environment variable

---

## TIER 4: Extended Plugins

### Compound Engineering - 27 Agents, 20 Commands
```bash
/plugin marketplace add https://github.com/EveryInc/compound-engineering-plugin
/plugin install compound-engineering
```
**Adds:**
- 14 review agents (security-sentinel, performance-oracle, etc.)
- 4 research agents
- 5 workflow agents
- `/workflows:plan`, `/workflows:work`, `/workflows:review`, `/workflows:compound`

### Claude-Mem - Session Memory
```bash
/plugin marketplace add thedotmack/claude-mem
/plugin install claude-mem
```
**Adds:** Automatic session memory with AI compression
**Note:** The unified template uses opt-in memory instead; use this if you prefer auto-capture

### Ralph - Autonomous Loops
```bash
# Clone and use directly
git clone https://github.com/snarktank/ralph.git
```
**Adds:** Long-running autonomous feature implementation
**Note:** The unified template includes `/sprint` command which implements this pattern

---

## Recommended Setups

### Minimal (Default Template)
```
sequential-thinking + context7 + playwright + memory
```
All in `.mcp.json`, works out of box.

### Web Developer
```
Default + exa + jina + github
```
Add search and GitHub integration.

### Backend Developer
```
Default + postgres + github + filesystem
```
Database and GitHub access.

### Full Stack (Maximum Power)
```
Default + exa + jina + github + postgres + compound-engineering
```
Everything for complex projects.

### AI/ML Engineer
```
Default + exa + jina
```
Research-focused with documentation access.

---

## Configuration Reference

### Environment Variables

| Variable | Server | Purpose |
|----------|--------|---------|
| `EXA_API_KEY` | exa | Enhanced search |
| `JINA_API_KEY` | jina | More URL reads |
| `GITHUB_TOKEN` | github | GitHub API access |
| `DATABASE_URL` | postgres | Database connection |
| `NEON_API_KEY` | neon | Neon database |
| `BRAVE_API_KEY` | brave-search | Brave search |
| `PERPLEXITY_API_KEY` | perplexity | Perplexity AI |
| `FIRECRAWL_API_KEY` | firecrawl | Web scraping |

### Add to settings.local.json

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "${GITHUB_TOKEN}"
      }
    },
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres"],
      "env": {
        "DATABASE_URL": "${DATABASE_URL}"
      }
    }
  }
}
```

---

## ⚠️ Context Window Management

### Critical: MCP Overhead Impact

**Your 200k context budget shrinks dramatically with excessive tool loading.**

| MCPs Enabled | Active Tools | Context Available | % Lost |
|--------------|--------------|-------------------|--------|
| 0-5 servers | <40 tools | ~190k tokens | 5% |
| 6-10 servers | 40-80 tools | ~150k tokens | 25% |
| 11-20 servers | 80-150 tools | ~100k tokens | 50% |
| 20+ servers | >150 tools | ~70k tokens | 65% |

**Recommended Limits:**
- **Configure:** 20-30 MCPs total maximum
- **Enable:** <10 per project actively
- **Active Tools:** Keep under 80 tools
- **Best Practice:** Enable only what you need right now

### Token Budget Per Server

| Server | Approx Overhead | Recommended Usage |
|--------|-----------------|-------------------|
| sequential-thinking | ~500 tokens | Always (essential) |
| context7 | ~300 tokens | Always (essential) |
| playwright | ~800 tokens | Enable for UI work only |
| memory | ~400 tokens | Always (essential) |
| exa | ~400 tokens | Enable for research only |
| jina | ~350 tokens | Enable for research only |
| github | ~600 tokens | Enable for PR/issue work |
| postgres | ~500 tokens | Enable for DB work |
| compound-eng (plugin) | ~2000 tokens | High overhead, powerful |

### Managing Context Budget

**1. Disable Unused Servers**
```json
// In .mcp.json
"disabledMcpServers": [
  "playwright",  // Only enable for browser testing
  "exa",         // Only enable for research tasks
  "jina",        // Only enable for web reading
  "github",      // Only enable for PR/issue work
  "postgres"     // Only enable for DB work
]
```

**2. Project-Specific Configs**
```bash
# Web app project - enable UI tools
cp .mcp-web.json .mcp.json

# Backend project - enable DB tools  
cp .mcp-backend.json .mcp.json

# Research project - enable search tools
cp .mcp-research.json .mcp.json
```

**3. Runtime Management**
```bash
# Check enabled servers
/mcp

# Disable server temporarily
/mcp disable playwright

# Re-enable when needed
/mcp enable playwright

# Compact context when getting full
/compact
```

**4. Monitor Context Usage**
- Check status bar for context consumption
- Warning at 80% (160k tokens used)
- Critical at 90% (180k tokens used)
- Use `/compact` before hitting limits

### Best Practices

**✓ DO:**
- Start with 4 essential servers (sequential-thinking, context7, playwright, memory)
- Enable additional servers only when task requires them
- Disable after use to reclaim context
- Use project-specific MCP configs
- Monitor context usage in status bar
- Compact context regularly

**✗ DON'T:**
- Enable all MCPs "just in case"
- Leave research tools enabled during coding
- Ignore context warnings
- Add servers without measuring impact
- Use heavy plugins for simple tasks

### Troubleshooting Context Issues

**Symptom:** Responses getting cut off
**Solution:** `/compact` or disable unused MCPs

**Symptom:** Slow startup (>5 seconds)
**Solution:** Reduce active MCP count to <10

**Symptom:** "Context limit exceeded" errors
**Solution:** Disable non-essential MCPs immediately

**Tips:**
- Disable unused MCPs with `/mcp` command
- Each server adds to system prompt overhead
- Use `/compact` to summarize context
- Use `/clear` between unrelated tasks
- Fewer, powerful tools > many specialized tools

---

## Troubleshooting

### Server not loading
```bash
# Check if npx works
npx -y @modelcontextprotocol/server-sequential-thinking --version

# Verify in Claude Code
/mcp
```

### API key not working
```bash
# Verify environment variable is set
echo $GITHUB_TOKEN

# Add to shell profile
echo 'export GITHUB_TOKEN=xxx' >> ~/.zshrc
source ~/.zshrc
```

### Too many servers (slow startup)
Remove servers you don't use from `.mcp.json` or `settings.local.json`.

---

## Links

- [MCP Server List](https://github.com/modelcontextprotocol/servers) - Official servers
- [Claude Code Docs](https://docs.anthropic.com/en/docs/claude-code) - Official docs
- [Compound Engineering](https://github.com/EveryInc/compound-engineering-plugin) - Extended plugin
- [Claude-Mem](https://github.com/thedotmack/claude-mem) - Session memory
- [Ralph](https://github.com/snarktank/ralph) - Autonomous loops
