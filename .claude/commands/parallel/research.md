# /parallel/research - Parallel Multi-Source Research

Launch multiple research queries concurrently using Exa, Context7, web search, and codebase analysis. Synthesize into comprehensive report.

## When to Use
- Unfamiliar technology/framework
- Comparing multiple approaches
- Architecture decisions
- Multiple unknowns
- Need fast comprehensive answers

## Arguments
$ARGUMENTS - Research questions (can be multiple, separated by semicolons)

## Process

1. **Parse Questions**
   - Extract key topics
   - Identify research types needed
   - Determine best tools for each

2. **Launch Parallel Research**
   - Exa Code Context (for code examples)
   - Context7 (for official docs)
   - Exa Web Search (deep mode for thorough)
   - Exa Company Research (if company-related)
   - Grep/Glob (codebase patterns)
   - WebSearch (fallback)

3. **Synthesize Findings**
   - Merge related information
   - Resolve conflicts
   - Rate reliability
   - Extract patterns

4. **Generate Report**
   - Organized by topic
   - Sources cited with URLs
   - Code examples included
   - Recommendations prioritized

## Example
```
/parallel/research "How to implement OAuth with Next.js; Best practices for PostgreSQL connection pooling"
/parallel/research "Redis vs Memcached for session storage"
/parallel/research "Stripe vs Square payment integration"
```

## Output Format
```
## Parallel Research Report

### Research Questions
1. [Question 1]
2. [Question 2]
3. [Question 3]

**Research Strategy:**
- Queries launched: [count]
- Tools used: Exa Code, Context7, Exa Web, Codebase
- Execution time: [duration] (parallel)

---

### [Topic 1]

#### Executive Summary
[1-2 sentence answer with recommendation]

#### Official Documentation
[From Context7]

**Source:** /[org]/[project] or [URL]
**Benchmark Score:** [score]/100
**Reliability:** HIGH

#### Code Examples
```typescript
// Source: Exa Code Context
// Example: [what this demonstrates]
[working code example]
```

#### Codebase Patterns
**Existing Implementations:**
- src/auth/oauth.ts:45 - Current OAuth implementation
- lib/session.ts:23 - Session handling pattern

**Pattern Analysis:**
[How codebase currently handles this]

#### Best Practices (Exa Web Search - Deep Mode)
1. [Best practice 1]
   - Why: [explanation]
   - Source: [URL]

2. [Best practice 2]
   - Why: [explanation]
   - Source: [URL]

**Sources:**
- [Article Title] - [URL]
- [Article Title] - [URL]

**Reliability:** MEDIUM-HIGH

#### Comparison (if applicable)
| Approach | Pros | Cons | Use When | Cost |
|----------|------|------|----------|------|
| OAuth 2.0 | Standard, secure | Complex | Public apps | Free |
| Magic Links | Simple UX | Email dependent | Internal | Low |

**Recommendation:** [Choice] - [Rationale]

---

### [Topic 2]
[Same detailed structure...]

---

### Cross-Topic Insights
[Patterns that emerged across multiple topics]

- [Insight 1]
- [Insight 2]

---

### Implementation Roadmap

#### Recommended Order
1. [Topic/Task] - Priority: HIGH
   - Why first: [rationale]
   - Dependencies: None
   - Effort: [estimate]

2. [Topic/Task] - Priority: MEDIUM
   - Why next: [rationale]
   - Dependencies: Task 1
   - Effort: [estimate]

#### Code Patterns to Adopt
[Patterns from research that should be applied]

**Save to memory?** YES
→ Suggested for .claude/memory/patterns.md:
```markdown
## [Pattern Name]
- Context: [when to use]
- Implementation: [how]
- Source: [research topic]
```

---

### All Sources Consulted

#### High Reliability
| Source | Type | Reference |
|--------|------|-----------|
| Next.js Docs | Context7 | /vercel/next.js |
| OAuth 2.0 Spec | Exa Web | [url] |
| Current codebase | Grep | src/auth/* |

#### Medium Reliability
| Source | Type | Reference |
|--------|------|-----------|
| Auth0 Blog | Exa Web | [url] |
| Developer Guide | Exa Web | [url] |

**Total Sources:** [count]
**High Reliability:** [count]
**Medium Reliability:** [count]

---

### Research Performance

**Parallel Execution:**
- Total queries: [count]
- Time taken: [duration]
- vs Sequential: ~[X]x faster

**Tool Breakdown:**
- Exa Code Context: [count] queries, [time]
- Context7: [count] queries, [time]
- Exa Web Search: [count] queries, [time]
- Codebase Search: [count] queries, [time]

---

### Next Steps

#### Immediate Actions
1. [ ] [Action based on research]
2. [ ] [Action based on research]

#### Follow-up Research Needed
- [ ] [Topic that needs deeper investigation]
- [ ] [Unclear area that needs clarification]

#### Memory Updates
- [ ] Save [X] patterns to memory/patterns.md
- [ ] Document decision in memory/decisions.md

---

**Status:** SUCCESS | PARTIAL | FAILED
**Confidence Level:** [HIGH|MED|LOW]
[If not SUCCESS: what's missing]
```

## Research Agents & Tools

### Primary Tools (Parallel Execution)
1. **Exa Code Context** - Code examples, API usage
   - Tokens: 5000-50000 based on complexity
   - Best for: "How to [code task]"

2. **Context7** - Official framework docs
   - Two-step: resolve → query
   - Best for: Framework-specific questions

3. **Exa Web Search** - Comprehensive web research
   - Mode: "deep" for thorough research
   - Livecrawl: "preferred" for latest
   - Best for: Best practices, comparisons

4. **Exa Company Research** - Business intelligence
   - Best for: Company info, competitive analysis

5. **Codebase Search** (Grep/Glob/Read)
   - Find existing patterns
   - High reliability source

6. **WebSearch** - Fallback general search
   - US-only
   - Medium reliability

### Specialist Agents (Optional)
- `researcher` agent - Coordinates research
- `explorer` agent - Codebase patterns
- `architect` agent - Design decisions

## Quality Criteria
- ✓ Multiple sources per question
- ✓ All sources cited with URLs
- ✓ Code examples tested
- ✓ Reliability ratings honest
- ✓ Conflicts noted and explained
- ✓ Clear recommendations
- ✓ Actionable next steps

## Rules
- Launch ALL research in parallel
- Use best tool for each question type
- Cite every source with URL
- Rate reliability honestly
- Synthesize, don't just aggregate
- Provide working code examples
- Link to codebase patterns
- Suggest memory saves for patterns
- Note information gaps clearly
