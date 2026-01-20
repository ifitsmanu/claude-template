# Parallel Feature Implementation

Implement the following feature using parallel agents: $ARGUMENTS

## Workflow (7 parallel agents)
Launch these simultaneously:
1. **Component Agent**: Create main component/module
2. **Styles Agent**: Create styles/CSS if applicable  
3. **Tests Agent**: Write unit tests
4. **Types Agent**: Create type definitions
5. **Hooks Agent**: Create hooks/utilities
6. **Integration Agent**: Update routing/imports/exports
7. **Config Agent**: Update configs/docs

## Rules
- Each agent works in isolation (own context)
- Save outputs to distinct files
- No agent should touch another agents files
- Final synthesis after all complete

Use: Task tool with 7 parallel subagents
