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

## Token Budget Reference

| Server | Approx Overhead |
|--------|-----------------|
| sequential-thinking | ~500 tokens |
| context7 | ~300 tokens |
| playwright | ~800 tokens |
| memory | ~400 tokens |
| exa | ~400 tokens |
| jina | ~350 tokens |
| github | ~600 tokens |
| postgres | ~500 tokens |

**Tips:**
- Disable unused MCPs with `/mcp` command
- Each server adds to system prompt overhead
- Use `/compact` to summarize context
- Use `/clear` between unrelated tasks

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
