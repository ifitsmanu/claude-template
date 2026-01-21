# /build - Parallel Feature Implementation

Parallel multi-agent implementation for features that span multiple areas.

## When to Use
- Feature touches frontend AND backend
- Multiple independent components needed
- Speed matters and work is parallelizable

## When NOT to Use
- Simple single-file changes (just do it)
- Tightly coupled changes (sequential better)
- Complex architecture decisions needed (use `/plan` first)

## Arguments
$ARGUMENTS - Feature description and optional agent flags

## Flags
- `--frontend` - Include frontend agent
- `--backend` - Include backend agent
- `--database` - Include database agent
- `--tests` - Include tester agent
- `--all` - Include all relevant agents

## Process

1. **Parse scope**
   - Identify which agents needed
   - Determine parallelizable work
   - Identify dependencies

2. **Launch parallel agents**
   Use Task tool with multiple agents simultaneously:
   - Each agent works on their domain
   - Independent work runs in parallel
   - Dependent work is sequenced

3. **Coordinate results**
   - Collect outputs from all agents
   - Identify integration points
   - Resolve conflicts if any

4. **Verify integration**
   - Run full test suite
   - Check for conflicts
   - Verify feature works end-to-end

## Agents (Parallel)
- `frontend` - UI components, styling
- `backend` - API endpoints, services
- `database` - Schema, migrations
- `tester` - Test coverage

## Example
```
/build "user profile page with avatar upload" --all
/build "API rate limiting" --backend --database
/build "dark mode toggle" --frontend
```

## Agent Coordination

### Parallel (No Dependencies)
```
frontend ──┐
           ├── Merge results
backend ───┘
```

### Sequential (With Dependencies)
```
database → backend → frontend → tester
```

### Hybrid (Mixed)
```
database ─────→ backend ──┐
                          ├── tester
frontend ─────────────────┘
```

## Output Format
```
## Build Summary

### Agents Deployed
- [agent]: [scope of work]

### Frontend (if included)
- Components: [list]
- Files: [list]
- Status: SUCCESS | FAILED

### Backend (if included)
- Endpoints: [list]
- Services: [list]
- Files: [list]
- Status: SUCCESS | FAILED

### Database (if included)
- Migrations: [list]
- Schema changes: [list]
- Status: SUCCESS | FAILED

### Tests (if included)
- Test files: [list]
- Coverage: [metrics]
- Status: SUCCESS | FAILED

### Integration
- Conflicts resolved: [list or none]
- Integration verified: YES | NO

### Overall Status: SUCCESS | PARTIAL | FAILED
[Summary of what was built]
```

## Conflict Resolution
When agents produce conflicting outputs:
1. Identify the conflict
2. Defer to relevant specialist (e.g., architect for design)
3. Manually resolve if needed
4. Document resolution

## Rules
- Maximize parallel execution
- Minimize inter-agent dependencies
- Verify integration after parallel work
- Run tests before marking success
- Each agent stays in their lane
