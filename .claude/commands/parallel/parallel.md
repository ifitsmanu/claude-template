# /parallel - Custom Multi-Agent Execution

Run multiple agents in parallel with custom configuration.

## When to Use
- Custom agent combination needed
- Multiple independent reviews
- Parallel analysis tasks
- Speed-critical operations

## Arguments
$ARGUMENTS - Task description followed by --agents flag

## Syntax
```
/parallel "[task description]" --agents [agent1,agent2,agent3]
```

## Available Agents

### Core Agents
- `builder` - Implement code (Haiku)
- `reviewer` - Review code quality (Sonnet)
- `debugger` - Find bugs (Haiku)
- `tester` - Write tests (Haiku)
- `architect` - Design systems (Sonnet)

### Specialist Agents
- `security` - Security audit (Sonnet)
- `performance` - Performance analysis (Sonnet)
- `database` - Database work (Sonnet)
- `frontend` - UI implementation (Haiku)
- `backend` - API implementation (Haiku)
- `ai-engineer` - AI/ML features (Sonnet)
- `designer` - UX/UI design (Sonnet)

## Process

1. **Parse arguments**
   - Extract task description
   - Parse agent list from --agents flag

2. **Launch agents in parallel**
   ```
   Task tool with subagent_type for each agent
   All launched simultaneously
   ```

3. **Collect results**
   - Wait for all agents to complete
   - Aggregate outputs
   - Identify conflicts

4. **Present combined output**
   - Group by agent
   - Highlight conflicts if any
   - Provide summary

## Example
```
/parallel "Review the auth module" --agents reviewer,security,performance
/parallel "Implement user dashboard" --agents frontend,backend,tester
/parallel "Analyze system architecture" --agents architect,security,performance
```

## Output Format
```
## Parallel Execution Results

### Task
[Task description]

### Agents Executed
- [agent1]: [completion status]
- [agent2]: [completion status]

---

### [Agent 1 Name] Output
[Agent 1's full output]

---

### [Agent 2 Name] Output
[Agent 2's full output]

---

### Conflicts (if any)
- [Conflict description]
- Resolution: [how to resolve]

### Summary
- Agents completed: [X/Y]
- Conflicts: [count]
- Overall status: SUCCESS | PARTIAL | FAILED
```

## Conflict Resolution Priority
When agents disagree:
1. Security agent wins on security issues
2. Architect agent wins on design issues
3. Reviewer agent wins on code quality
4. Escalate to human if unresolved

## Common Patterns

### Comprehensive Review
```
/parallel "Review PR #123" --agents reviewer,security,performance
```

### Full-Stack Implementation
```
/parallel "Build feature X" --agents frontend,backend,database,tester
```

### Architecture Analysis
```
/parallel "Analyze system for scaling" --agents architect,performance,database
```

### Security Audit
```
/parallel "Security audit" --agents security,reviewer
```

## Rules
- All agents run independently
- No agent can see another's output during execution
- Results are combined after all complete
- User resolves conflicts if agents disagree
- Timeout after 5 minutes per agent
