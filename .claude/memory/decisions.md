# Architecture Decision Log

Record of significant technical decisions with context and rationale. Never delete - decisions provide historical context.

---

<!--
TEMPLATE FOR NEW DECISIONS:

## [YYYY-MM-DD] - [Decision Title]

### Context
[What is the issue that we're seeing that is motivating this decision?]

### Decision
[What is the change that we're proposing and/or doing?]

### Options Considered
1. [Option A] - [Brief description]
   - Pros: [list]
   - Cons: [list]

2. [Option B] - [Brief description]
   - Pros: [list]
   - Cons: [list]

### Rationale
[Why is this change being made? What alternatives were considered?]

### Consequences
- [Positive consequence]
- [Negative consequence / tradeoff]
- [Risk and mitigation]

### Status
[Proposed | Accepted | Deprecated | Superseded by [link]]

---
-->

<!-- EXAMPLE DECISION:

## 2024-01-15 - Use PostgreSQL for Primary Database

### Context
We need to choose a primary database for the application. Key requirements are ACID transactions for financial data, complex reporting queries, and team familiarity.

### Decision
Use PostgreSQL as the primary database.

### Options Considered
1. PostgreSQL
   - Pros: ACID, mature, excellent tooling, team knows it
   - Cons: Vertical scaling limits

2. MongoDB
   - Pros: Flexible schema, horizontal scaling
   - Cons: No ACID across documents, complex queries harder

3. MySQL
   - Pros: Widely used, good performance
   - Cons: Less feature-rich than PostgreSQL

### Rationale
ACID transactions are critical for payment processing. Team has PostgreSQL experience. Complex reporting queries are better served by relational model.

### Consequences
- ✅ Reliable transactions for financial data
- ✅ Powerful query capabilities for reporting
- ⚠️ May need read replicas at scale
- ⚠️ Schema migrations require planning

### Status
Accepted

---
-->

<!-- Add your decisions below this line -->

## 2026-01-21 - Disable claude-mem Plugin in Favor of Memory MCP Server

### Context
The template philosophy is "Selective Memory System - No auto-capture. No pollution." Claude-mem plugin was creating auto-generated CLAUDE.md files throughout the repository despite settings (`CLAUDE_MEM_FOLDER_CLAUDEMD_ENABLED: false`, `CLAUDE_MEM_LIVE_CONTEXT_ENABLED: false`). These files appeared in multiple directories (`.claude/`, `.claude/agents/core/`, `.claude/prd/`) containing automatic context injection tables.

### Decision
Disable claude-mem plugin globally and rely exclusively on the memory MCP server for manual, opt-in memory management.

### Options Considered
1. **Disable claude-mem entirely**
   - Pros: Zero noise, zero config, aligns perfectly with template philosophy
   - Cons: Lose AI compression and historical context auto-capture
   
2. **Set CLAUDE_MEM_CONTEXT_OBSERVATIONS to 0**
   - Pros: Keep compression, can query history on-demand
   - Cons: CLAUDE.md files still appear (bug), SessionStart hook still runs, complexity remains

3. **Fix claude-mem settings**
   - Pros: Keep all features
   - Cons: Settings not honored (likely plugin bug), ongoing maintenance burden

### Rationale
- Template explicitly states "No auto-capture. No pollution."
- Memory MCP server provides all needed functionality for `/memory` commands
- Auto-generated CLAUDE.md files violate the opt-in philosophy
- Settings to disable file generation are not being honored
- Memory MCP server gives manual control without automatic behavior

### Consequences
- ✅ Zero repository noise from auto-generated files
- ✅ Clean, predictable behavior aligned with template philosophy  
- ✅ Memory still available via `/memory` commands using MCP server
- ✅ File-based memory in `.claude/memory/` (patterns, decisions, learnings)
- ⚠️ No automatic compression of session history
- ⚠️ Users must explicitly save valuable context via `/memory save`

### Status
Accepted

### Implementation
1. Set `"claude-mem@thedotmack": false` in `~/.claude/settings.json`
2. Stopped all claude-mem worker processes
3. Removed auto-generated CLAUDE.md files from repo (kept project root template file)
4. Verified memory MCP server configured in `.claude/settings.local.json`
5. Existing `/memory` command uses file-based storage in `.claude/memory/`

---

## 2026-01-21 - Implement Rules-Based Quality Gates

### Context
Needed explicit, enforceable standards for testing, security, and code quality. Inspired by everything-claude-code repository's battle-tested approach with 10+ months of production use.

### Decision
Create `.claude/rules/` directory with four rule files: testing.md, security.md, quality.md, and agent-delegation.md.

### Options Considered
1. **Dedicated rules directory** - Clear separation, always enforced, explicit standards
2. **Embed in CLAUDE.md** - Gets too large, harder to enforce specific rules
3. **Agent prompts only** - Inconsistent enforcement, harder to audit

### Rationale
Rules are NON-NEGOTIABLE guidelines vs optional best practices. Separate files allow focused enforcement and easy reference. Proven pattern from production-tested templates.

### Consequences
- ✅ 80% test coverage is now mandatory, not advisory
- ✅ OWASP Top 10 checks are explicit and enforced
- ✅ Clear agent delegation prevents overlap
- ⚠️ More rigid workflow (intentional tradeoff)

### Status
Accepted

---

## 2026-01-21 - Add Context Window Management Documentation

### Context
200k context budget shrinks to 70k with 20+ MCPs enabled. Critical issue not documented anywhere. everything-claude-code discovered this through painful experience.

### Decision
Add prominent warnings in CLAUDE.md and PLUGINS.md with specific limits (< 10 servers, <80 tools) and management strategies.

### Rationale
Context degradation is silent but severe. Users need to know limits BEFORE hitting them.

### Consequences
- ✅ Users understand MCP overhead
- ✅ Clear guidelines prevent context exhaustion
- ⚠️ Requires discipline to disable unused MCPs

### Status
Accepted

---
