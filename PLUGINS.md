# Plugin & MCP Installation Guide

## TIER 1: Essential (Install First)

### 1. mgrep - Semantic Search (Replaces grep/glob)
Natural language code search. 2x fewer tokens than grep workflows.
```bash
mgrep install-claude-code claude
```

**Usage:**
```bash
mgrep "Where is auth middleware?"       # Semantic local search
mgrep --web --answer "How to use X"     # Include web results
mgrep -m 10 "query"                     # Limit results
```

---

## TIER 2: Web Search & Research MCP Servers

### Sequential Thinking - Deep Reasoning (MUST HAVE)
```bash
claude mcp add sequential-thinking -s user -- npx -y @modelcontextprotocol/server-sequential-thinking
```
Use for: Complex architectural decisions, debugging, planning

### Context7 - Real-Time Library Documentation
```bash
claude mcp add context7 -s user --transport http https://mcp.context7.com/mcp
```
Use for: Up-to-date API docs, library references

### Exa - AI-Powered Search + Code Context (FREE)
```bash
# HTTP transport (no API key needed for basic use)
claude mcp add exa -s user --transport http https://mcp.exa.ai/mcp
```
**Tools:**
- `web_search_exa` - Semantic web search
- `get_code_context_exa` - Find code examples, GitHub repos, API docs

### Jina AI - Web Reader + SERP (FREE TIER)
```bash
# HTTP transport
claude mcp add jina -s user --transport http https://mcp.jina.ai/v1
```
**Tools:**
- `read_url` - Fetch any URL as clean markdown
- `parallel_read_url` - Batch fetch multiple URLs
- `web_search` - SERP results for reasoning

### Brave Search - Privacy-Focused Search
```bash
claude mcp add brave-search -s user -- npx -y @anthropic/mcp-server-brave-search
# Requires BRAVE_API_KEY env var
```
Use for: General web search, privacy-focused

### Perplexity - AI Research (REQUIRES API KEY)
```bash
claude mcp add perplexity -s user -- npx -y @anthropic/mcp-server-perplexity
# Requires PERPLEXITY_API_KEY env var
```
Use for: Deep research, factual queries with citations

### Firecrawl - Web Scraping (500 FREE CREDITS)
```bash
claude mcp add firecrawl -s user -- npx -y firecrawl-mcp
# Requires FIRECRAWL_API_KEY env var
```
**Tools:**
- Crawl entire sites
- Extract structured data
- Handle JS-heavy pages

---

## TIER 3: Browser Automation

### Playwright - Browser Testing (RECOMMENDED)
```bash
claude mcp add playwright -s user -- npx -y @anthropic/mcp-server-playwright
```
Use for: Interactive testing, form filling, screenshots
**Tip:** Say "use playwright mcp" explicitly first time

### Puppeteer - Alternative Browser Control
```bash
claude mcp add puppeteer -s user -- npx -y @modelcontextprotocol/server-puppeteer
```
Use for: Web scraping, automation scripts

---

## TIER 4: Development Tools

### GitHub - PR/Issue Management
```bash
claude mcp add github -s user -- npx -y @modelcontextprotocol/server-github
# Requires GITHUB_TOKEN env var
```

### PostgreSQL - Database Queries
```bash
claude mcp add postgres -s user -- npx -y @modelcontextprotocol/server-postgres "postgresql://user:pass@localhost/db"
```

### Filesystem - Local File Operations
```bash
claude mcp add filesystem -s user -- npx -y @modelcontextprotocol/server-filesystem /path/to/project
```

---

## TIER 5: Full Toolkit Plugin

### compound-engineering - 27 Agents, 20 Commands
```bash
npx claude-plugins install @EveryInc/every-marketplace/compound-engineering
```
Includes: Code review, testing, documentation, refactoring agents

---

## Omnisearch - All-in-One Alternative
If you want ONE server for multiple search providers:
```bash
# Combines: Tavily, Brave, Kagi, Perplexity, Jina
claude mcp add omnisearch -s user -- npx -y mcp-omnisearch
# Set API keys for providers you want to use
```

---

## Recommended Setup by Use Case

### Web Developer
```
sequential-thinking + context7 + playwright + exa
```

### Backend Developer  
```
sequential-thinking + context7 + postgres + github
```

### Researcher
```
sequential-thinking + perplexity + jina + firecrawl
```

### Full Stack (Maximum Power)
```
mgrep + sequential-thinking + context7 + exa + jina + playwright
```

---

## Token Budget Tips

| MCP Server | Approx Token Cost |
|------------|-------------------|
| sequential-thinking | ~500 tokens |
| context7 | ~300 tokens |
| exa | ~400 tokens |
| jina | ~350 tokens |
| playwright | ~800 tokens |
| filesystem | ~400 tokens |

**Rules:**
- Disable unused MCPs (`/mcp` to manage)
- Each MCP adds to system prompt overhead
- Use mgrep instead of built-in grep (2x savings)
- Use /compact to summarize context
- Use /clear between unrelated tasks
