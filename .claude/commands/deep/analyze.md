# /deep/analyze - Deep Codebase Analysis

Comprehensive analysis of codebase patterns, architecture, and technical debt. Uses thinking tool and multiple specialized agents for thorough investigation.

## When to Use
- Understanding unfamiliar codebase
- Pre-refactor assessment
- Technical debt audit
- Architecture documentation needed
- Before major changes

## Arguments
$ARGUMENTS - Focus area (optional): "architecture" | "patterns" | "debt" | "security" | "performance"

## Process

1. **Map Structure**
   - Identify all major components
   - Document data flow
   - Find external dependencies

2. **Pattern Recognition**
   - Extract naming conventions
   - Identify architectural patterns
   - Document code organization

3. **Quality Assessment**
   - Test coverage analysis
   - Code complexity metrics
   - Technical debt hotspots

4. **Security Scan**
   - Identify security patterns
   - Find potential vulnerabilities
   - Document auth/authz flow

5. **Generate Report**
   - Executive summary
   - Detailed findings
   - Recommendations with priority

## Agents Used
- `explorer` (thorough mode) - Initial discovery
- `architect` - Architecture analysis
- `security` specialist - Security review
- `performance` specialist - Performance analysis

## Example
```
/deep/analyze                          # Full analysis
/deep/analyze architecture             # Focus on architecture
/deep/analyze debt                     # Technical debt only
/deep/analyze security                 # Security-focused
```

## Output Format
```
## Deep Analysis Report

### Overview
- Total files: [count]
- Languages: [list]
- Key frameworks: [list]
- Last analyzed: [timestamp]

### Architecture
[High-level architecture description with diagrams]

### Patterns Discovered
#### Naming Conventions
- [pattern]

#### Code Organization
- [pattern]

#### Data Flow
- [description]

### Quality Metrics
- Test coverage: [X]%
- Avg complexity: [score]
- Tech debt score: [1-10]

### Technical Debt
#### High Priority
- [issue] - Impact: [description]

#### Medium Priority
- [issue]

#### Low Priority
- [issue]

### Security Findings
- [finding] - Severity: [HIGH|MED|LOW]

### Performance Findings
- [finding] - Impact: [description]

### Recommendations
1. [recommendation] - Priority: [HIGH|MED|LOW]
2. [recommendation]

### Codebase Patterns (Save to memory)
[Patterns that should be saved to .claude/memory/patterns.md]

---
Report generated: [timestamp]
Time taken: [duration]
```

## Output Files
```
.claude/reports/analysis-[timestamp].md
```

## Rules
- Use sequential-thinking for complex analysis
- Run all agents in parallel for speed
- Generate actionable recommendations
- Flag critical issues prominently
- Suggest memory saves for important patterns
- No changes to code - analysis only
