# /plan - Feature Planning

Architectural planning for non-trivial features. Creates implementation plan for approval.

## When to Use
- New feature implementation
- Significant code changes
- Unclear requirements need clarification
- Multiple approaches possible

## When NOT to Use
- Bug fixes (use `/fix` or `/debug`)
- Simple changes (just do it)
- Refactoring (use `/refactor`)

## Arguments
$ARGUMENTS - Feature description to plan

## Process

1. **Enter plan mode**
   Use EnterPlanMode tool to signal planning phase

2. **Research existing code**
   - Find relevant files with Glob/Grep
   - Understand current patterns
   - Identify integration points

3. **Use architect agent**
   - Analyze requirements
   - Consider approaches
   - Evaluate tradeoffs

4. **Use sequential-thinking** (if complex)
   - Break down architecture decisions
   - Explore alternatives
   - Document rationale

5. **Create implementation plan**
   - Step-by-step instructions
   - File:line references
   - Dependencies and order

6. **Exit plan mode**
   Use ExitPlanMode to request approval

## Agents
- Primary: `architect` (Sonnet)
- Support: `sequential-thinking` MCP (for complex decisions)

## Example
```
/plan "Add OAuth2 authentication with Google and GitHub"
/plan "Implement real-time notifications using WebSockets"
/plan "Create caching layer for API responses"
```

## Output Format
```
## Implementation Plan: [Feature Name]

### Overview
[What we're building and why]

### Requirements
- [ ] [Requirement 1]
- [ ] [Requirement 2]

### Architecture Decision
[Chosen approach with rationale]

#### Alternatives Considered
- [Alternative A]: [why not chosen]
- [Alternative B]: [why not chosen]

### Implementation Steps

#### Phase 1: [Name]
1. [file:line] [action]
2. [file:line] [action]

#### Phase 2: [Name]
1. [file:line] [action]
2. [file:line] [action]

### New Files
- [path] - [purpose]

### Modified Files
- [path] - [changes needed]

### Dependencies
- [New dependency if any]

### Testing Strategy
- Unit: [what to test]
- Integration: [what to test]
- Edge cases: [list]

### Risks
- [Risk]: [Mitigation]

### Estimated Scope
- Files: [count]
- Tests: [count]
- Complexity: [LOW/MEDIUM/HIGH]

---
**Ready for approval. Reply 'approved' to proceed with implementation.**
```

## After Approval
Once plan is approved:
1. Save decision to memory/decisions.md
2. Proceed with `/build` or direct implementation
3. Follow the plan steps in order

## Rules
- Always get approval before major implementations
- Document architectural decisions
- Consider security, performance, maintainability
- Keep plans concrete, not abstract
- Include testing strategy
