# Search with Memory

Search project history and codebase for: $ARGUMENTS

## Using mgrep (semantic search)
```bash
mgrep "natural language query"           # Local files
mgrep --web --answer "query"             # Include web results
mgrep -m 10 "query"                      # Limit results
```

## Using built-in tools
1. **Grep** - Pattern matching across files
2. **Glob** - Find files by name patterns
3. **Read** - Read specific file contents

## Search Strategy
1. Start with semantic search using mgrep for natural language queries
2. Use Grep for exact pattern matching
3. Use Glob to find files by extension or name pattern
4. Filter results before fetching full content to save tokens

## Token Savings
Never fetch full details without filtering first.
Use targeted searches to reduce token consumption.
