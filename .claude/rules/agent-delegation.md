# Rule: Agent Delegation

## When to Use Which Agent

### Core Agents (Always Available)

#### builder Agent
**Use when:**
- Implementing new features
- Writing production code
- Refactoring existing code
- Creating new files/modules

**Model:** haiku (fast)
**Tools:** Read, Write, Edit, Bash, Grep, Glob

**Don't use for:**
- Planning (use architect)
- Testing (use tester)
- Bug investigation (use debugger)

---

#### reviewer Agent
**Use when:**
- Code review before merge
- PR quality assessment
- Checking compliance with rules
- Final approval gate

**Model:** sonnet (thorough)
**Tools:** Read, Grep, Glob

**Output:** APPROVE | CHANGES_REQUESTED | REJECTED

**Don't use for:**
- Writing code (use builder)
- Planning (use architect)

---

#### debugger Agent
**Use when:**
- Investigating bugs
- Analyzing stack traces
- Finding root causes
- Reproducing issues

**Model:** haiku (fast iteration)
**Tools:** Read, Bash, Grep, Glob

**Don't use for:**
- Implementing fixes (use builder after diagnosis)
- Writing tests (use tester)

---

#### tester Agent
**Use when:**
- Writing test suites
- Improving test coverage
- Refactoring tests
- Validating 80% coverage

**Model:** haiku
**Tools:** Read, Write, Edit, Bash

**Must:**
- Follow TDD workflow (RED → GREEN → IMPROVE)
- Ensure 80% coverage
- Write all three test types (unit, integration, e2e)

**Don't use for:**
- Production code (use builder)

---

#### architect Agent
**Use when:**
- System design decisions
- Choosing patterns/technologies
- Planning complex features
- Technical architecture

**Model:** sonnet (complex reasoning)
**Tools:** Read, Grep, Glob, WebFetch, WebSearch, sequential-thinking

**Output:** Architecture decision with rationale

**Don't use for:**
- Implementation details (use builder)
- Bug fixes (use debugger)

---

### Specialist Agents (Conditional)

#### security Agent
**Auto-triggers when code touches:**
- Authentication/authorization
- User input handling
- Database queries
- Cryptographic operations
- Payment processing
- File system access
- External API calls

**Model:** sonnet
**Must check:** OWASP Top 10

**Output:** SECURE | VULNERABLE | NEEDS_REVIEW

---

#### performance Agent
**Use when:**
- Optimizing slow code
- Analyzing bottlenecks
- Reducing memory usage
- Improving response times

**Triggers:**
- Functions >100ms
- N+1 queries
- Memory leaks
- Large data processing

**Model:** sonnet

---

#### database Agent
**Use when:**
- Writing migrations
- Designing schema
- Optimizing queries
- Setting up indexes

**Auto-triggers:**
- Database schema changes
- Complex queries
- ORM configuration

**Model:** sonnet

---

#### frontend Agent
**Use when:**
- Building UI components
- State management
- Responsive design
- Browser compatibility

**Model:** haiku
**Stack-specific:** React, Vue, Svelte, etc.

---

#### backend Agent
**Use when:**
- API endpoint design
- Business logic
- Service architecture
- Data processing

**Model:** haiku
**Stack-specific:** Node, Python, Go, etc.

---

#### ai-engineer Agent
**Use when:**
- LLM integration
- RAG systems
- Embeddings
- Prompt engineering
- Vector databases

**Model:** sonnet
**Expertise:** OpenAI, Anthropic, Pinecone, Weaviate

---

#### designer Agent
**Use when:**
- Design system decisions
- UX improvements
- Visual consistency
- Accessibility

**Model:** sonnet

---

#### e2e-runner Agent (NEW)
**Use when:**
- Writing Playwright tests
- Testing user workflows
- Browser automation
- Cross-browser validation

**Model:** haiku
**Tools:** Playwright MCP, Read, Write, Bash

---

## Agent Delegation Workflow

### Single-Agent Tasks
```
User Request → Select Agent → Agent Works → Human Approves
```

**Example:**
```
"Fix login bug" → debugger agent → diagnosis → builder agent → fix
```

---

### Multi-Agent Tasks
```
User Request → architect → builder → tester → reviewer → Merge
```

**Example: New Feature**
1. **architect**: Plan OAuth implementation
2. **security**: Review auth design
3. **builder**: Implement code
4. **tester**: Write tests (80% coverage)
5. **reviewer**: Final approval

---

### Parallel Agent Tasks
```
User Request → builder + tester + frontend (parallel) → reviewer
```

**Example: Full-stack Feature**
```bash
/parallel/implement "user profile with avatar"
```
Launches:
- frontend agent (UI components)
- backend agent (API endpoints)
- database agent (schema changes)
- tester agent (all test types)

Then: reviewer agent validates all

---

## Agent Communication Patterns

### Builder → Tester Handoff
```
builder: "Implemented getUserById in src/user-service.ts"
tester: "Writing tests for getUserById covering:
  - Valid ID returns user
  - Invalid ID throws error
  - Null ID throws error"
```

### Debugger → Builder Handoff
```
debugger: "Bug root cause: null check missing at line 45"
builder: "Adding null check and defensive programming"
```

### Architect → Security Consultation
```
architect: "Planning to store passwords with bcrypt"
security: "APPROVED. Use cost factor 12+. Salt automatically included."
```

---

## Proactive Agent Activation

### Agents Should Self-Activate When

**security agent:**
- Code touches auth/authz
- User input processed
- Database queries written
- Files accessed

**performance agent:**
- Loop complexity >O(n²)
- Database queries in loops
- Large data structures
- Memory-intensive operations

**database agent:**
- Schema changes proposed
- New tables/columns
- Index creation needed

**tester agent:**
- New functions added
- Business logic changed
- Coverage drops below 80%

---

## Agent Status Reporting

### Standard Output Format
All agents MUST report:

```
## [AGENT] Report

[Agent work output]

## Status: SUCCESS | BLOCKED | FAILED

[If BLOCKED: what decision needs human input]
[If FAILED: what went wrong and why]
```

### Status Definitions

**SUCCESS**: Task completed fully
- All requirements met
- No blockers
- Ready for next step

**BLOCKED**: Needs human decision
- Multiple valid approaches exist
- Irreversible decision required
- Business context needed
- Ambiguous requirements

**FAILED**: Cannot complete
- Technical limitation
- Missing dependencies
- Conflicting requirements
- Error cannot be resolved

---

## Agent Boundaries

### Agents MUST NOT
- ❌ Override other agents without justification
- ❌ Bypass reviewer for merges
- ❌ Make irreversible decisions without human approval
- ❌ Implement before architect approves design
- ❌ Merge without tester confirming 80% coverage
- ❌ Deploy code security agent flagged as VULNERABLE

### Agents SHOULD
- ✅ Consult specialists when uncertain
- ✅ Escalate to human for business decisions
- ✅ Document reasoning in memory/decisions.md
- ✅ Report status clearly (SUCCESS/BLOCKED/FAILED)
- ✅ Pass work cleanly to next agent

---

## Agent Priority Hierarchy

### Final Authority
1. **Human** - Business decisions, irreversible choices
2. **architect** - Technical design and patterns
3. **security** - Security architecture
4. **reviewer** - Code quality and merge approval

### Conflict Resolution
```
security agent vs architect: 
  → security wins on security matters
  → architect wins on architecture
  → Human decides if still unclear

reviewer vs builder:
  → reviewer has final say on code quality
  → builder can appeal with justification
```

---

## Efficiency Rules

### Use Parallel Agents When
- Tasks are independent
- No shared state/files
- Can run simultaneously

### Use Sequential Agents When
- Output of one feeds into next
- Shared resources
- Order matters

### Use Single Agent When
- Simple, focused task
- Overhead not justified

---

## Agent Selection Cheat Sheet

| Task | Primary Agent | Support Agents | Model |
|------|--------------|----------------|-------|
| Fix bug | debugger → builder | - | haiku |
| New feature | architect → builder → tester | security, perf | sonnet/haiku |
| Code review | reviewer | security, perf | sonnet |
| Refactor | builder | reviewer | haiku |
| Optimize | performance | database | sonnet |
| Auth/authz | architect | security | sonnet |
| Database | database | security | sonnet |
| UI work | frontend | designer | haiku |
| API work | backend | security | haiku |
| Tests | tester | builder | haiku |
| LLM/RAG | ai-engineer | architect | sonnet |

---

## Success Metrics
- [ ] Right agent for task
- [ ] Smooth handoffs between agents
- [ ] Clear status reporting
- [ ] Specialists consulted when needed
- [ ] No duplicate work
- [ ] Human intervention only when necessary
