# /think - Deep Analysis

Extended thinking for genuinely hard problems. Uses sequential-thinking MCP with 32k token budget.

## When to Use
- Problem is genuinely complex
- Multiple valid approaches exist
- Tradeoffs are unclear
- Need to explore branches

## When NOT to Use
- Simple bugs (use `/fix`)
- Routine implementation (just do it)
- Time-sensitive fixes (overhead too high)

## Arguments
$ARGUMENTS - Problem description to analyze

## Process

1. **Invoke sequential-thinking MCP**
   Use `mcp__sequential-thinking__sequentialthinking` tool with:
   - thought: Current analytical step
   - thoughtNumber: Step index
   - totalThoughts: Estimated total (adjust as needed)
   - nextThoughtNeeded: true until done

2. **Decompose the problem**
   - Break into components
   - Identify dependencies
   - Map constraints

3. **Explore branches**
   - Consider alternatives
   - Use branchFromThought when paths diverge
   - Compare tradeoffs

4. **Generate hypotheses**
   - Form testable conclusions
   - Verify against constraints
   - Revise if needed

5. **Synthesize conclusion**
   - Summarize findings
   - Recommend next steps
   - Document decision rationale

## Thinking Features
- **Adaptive count**: Can extend beyond initial estimate
- **Branching**: Explore alternative approaches
- **Revision**: Reconsider previous conclusions
- **Uncertainty**: Express confidence levels

## Example
```
/think "How should we migrate from monolith to microservices while maintaining uptime?"
/think "What's the best caching strategy for our read-heavy workload?"
/think "How do we handle eventual consistency in our distributed system?"
```

## Output Format
```
## Deep Analysis: [Problem Summary]

### Problem Decomposition
1. [Component/aspect]
2. [Component/aspect]

### Key Constraints
- [Constraint]

### Approaches Considered

#### Approach A: [Name]
- Pros: [list]
- Cons: [list]
- Confidence: [HIGH/MEDIUM/LOW]

#### Approach B: [Name]
- Pros: [list]
- Cons: [list]
- Confidence: [HIGH/MEDIUM/LOW]

### Branches Explored
- Branch 1: [path taken, what was learned]
- Branch 2: [path taken, what was learned]

### Recommendation
[Chosen approach with clear rationale]

### Next Steps
1. [Actionable step]
2. [Actionable step]

### Uncertainties
- [What's still unclear and how to resolve]
```

## Rules
- Only use for genuinely hard problems
- Document all reasoning for future reference
- Express uncertainty when present
- Recommend concrete next steps
- Save important decisions to memory/decisions.md
