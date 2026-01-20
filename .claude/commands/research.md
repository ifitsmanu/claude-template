# Deep Web Research

Research thoroughly on: $ARGUMENTS

## Strategy (Multi-Source)

### 1. Quick Facts - Use WebSearch
Built-in Claude web search for quick answers.

### 2. Code Context - Use Exa MCP
```
get_code_context_exa: Find code examples, API docs, GitHub repos
web_search_exa: AI-powered semantic search
```

### 3. Documentation - Use Context7 MCP
Real-time library docs, up-to-date API references.

### 4. Deep Reading - Use Jina MCP  
```
read_url: Fetch and parse any URL to markdown
parallel_read_url: Batch fetch multiple URLs
web_search: SERP results for reasoning
```

### 5. Semantic Local - Use mgrep
```bash
mgrep "natural language query"           # Local codebase
mgrep --web --answer "query"             # Web + local combined
```

## Process
1. Start with WebSearch for overview
2. Use Exa for code examples and GitHub
3. Use Context7 for library-specific docs
4. Use Jina to deep-read key URLs
5. Synthesize findings with citations

Always cite sources with URLs.
