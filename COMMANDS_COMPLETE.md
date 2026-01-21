# Complete Slash Commands & Skills Reference

**Total: 66 Commands & Skills**
- 26 Template Commands
- 23 Compound-Engineering Commands  
- 14 Compound-Engineering Skills
- 3 Ralph-Wiggum Commands

Last Updated: 2026-01-21

---

## Table of Contents

### Template Commands (26)
- [Quick Tier](#template-quick-tier) - /fix, /commit, /ship
- [Shallow Tier](#template-shallow-tier) - /review, /refactor  
- [Deep Tier](#template-deep-tier) - /think, /plan, /debug
- [Parallel Tier](#template-parallel-tier) - /build, /parallel
- [Workflow Tier](#template-workflow-tier) - /memory, /sprint
- [Other Template Commands](#other-template-commands) - browser, search, test, security, explore, research

### Compound-Engineering (37 total)
- [Commands](#compound-engineering-commands) (23 commands)
- [Skills](#compound-engineering-skills) (14 skills)

### Ralph-Wiggum (3)
- [Commands](#ralph-wiggum-commands)

---

## Template Commands

<template_commands>
### Template: Quick Tier

#### /fix
Fast bug resolution without planning overhead.
```bash
/fix "button not responding"
```

#### /commit  
Safe commit with quality gates (lint, test, secrets).
```bash
/commit -m "fix: auth bug"
```

#### /ship
Full release: commit + push + PR.
```bash
/ship --draft
```

### Template: Shallow Tier

#### /review
Multi-agent code review.
```bash
/review --security --performance
```

#### /refactor
Code simplification without behavior changes.
```bash
/refactor src/utils/helpers.ts
```

### Template: Deep Tier

#### /think
Extended reasoning (32k tokens) for complex problems.
```bash
/think "WebSockets vs SSE for notifications?"
```

#### /plan
Feature implementation planning.
```bash
/plan "add OAuth authentication"
```

#### /debug
Root cause analysis with hypothesis testing.
```bash
/debug "random 500s at peaks"
```

### Template: Parallel Tier

#### /build
Parallel feature implementation across multiple agents.
```bash
/build "user profile with avatar, bio, activity feed"
```

#### /parallel
Custom multi-agent execution.
```bash
/parallel --agents "security,performance,database" --task "Review payments"
```

### Template: Workflow Tier

#### /memory
Manual opt-in memory management.
```bash
/memory save patterns "API routes /api/v1/[resource]"
/memory search "authentication"
/memory list
/memory prune --days 60
```

#### /sprint
Autonomous iteration (Ralph pattern).
```bash
/sprint init
/sprint .claude/prd/current.json
```

### Other Template Commands

#### /browser
Browser testing and automation.
```bash
/browser
```

#### /commit-push-pr
Alternative to /ship for commit + push + PR.
```bash
/commit-push-pr
```

#### /explore
Codebase exploration and discovery.
```bash
/explore
```

#### /research
Deep web research for technical topics.
```bash
/research
```

#### /search
Search with memory integration.
```bash
/search
```

#### /security
Security review and vulnerability scanning.
```bash
/security
```

#### /test
Test coverage and execution.
```bash
/test
```
</template_commands>

---

## Compound-Engineering Commands

### /agent-native-audit
Comprehensive agent-native architecture review with scored principles.

### /changelog
Create engaging changelogs for recent merges to main branch.
```bash
/changelog
```

### /create-agent-skill
Create or edit Claude Code skills with expert guidance.
```bash
/create-agent-skill
```

### /deepen-plan
Enhance a plan with parallel research agents for each section.
```bash
/deepen-plan
```

### /deploy-docs
Validate and prepare documentation for GitHub Pages deployment.
```bash
/deploy-docs
```

### /feature-video
Record video walkthrough of a feature and add to PR description.
```bash
/feature-video
```

### /generate_command
Create a new custom slash command following conventions.
```bash
/generate_command
```

### /heal-skill
Fix incorrect SKILL.md files when outdated or wrong.
```bash
/heal-skill [skill-name]
```

### /lfg
Full autonomous engineering workflow.
```bash
/lfg
```

### /plan_review
Have multiple specialized agents review a plan in parallel.
```bash
/plan_review
```

### /release-docs
Build and update documentation site with current components.
```bash
/release-docs
```

### /report-bug
Report a bug in the compound-engineering plugin.
```bash
/report-bug
```

### /reproduce-bug
Reproduce and investigate a bug using logs, console, browser screenshots.
```bash
/reproduce-bug
```

### /resolve_parallel
Resolve all TODO comments using parallel processing.
```bash
/resolve_parallel
```

### /resolve_pr_parallel
Resolve all PR comments using parallel processing.
```bash
/resolve_pr_parallel
```

### /resolve_todo_parallel
Resolve all pending CLI todos using parallel processing.
```bash
/resolve_todo_parallel
```

### /test-browser
Run browser tests on pages affected by current PR or branch.
```bash
/test-browser
```

### /triage
Triage and categorize findings for the CLI todo system.
```bash
/triage
```

### /xcode-test
Build and test iOS apps on simulator using XcodeBuildMCP.
```bash
/xcode-test
```

### Workflow Commands

#### /compound
Document a recently solved problem to compound team knowledge.
```bash
/compound
```

#### /plan (compound workflow)
Transform feature descriptions into well-structured project plans.
```bash
/plan
```

#### /review (compound workflow)
Exhaustive code reviews using multi-agent analysis, ultra-thinking, worktrees.
```bash
/review
```

#### /work
Execute work plans efficiently while maintaining quality.
```bash
/work
```

---

## Compound-Engineering Skills

Skills are invoked automatically by context or can be called via /skill command.

### /agent-browser
Browser automation using Vercel's agent-browser CLI.
**Triggers:** "browse website", "fill form", "click button", "take screenshot", "scrape page"

### /agent-native-architecture
Build applications where agents are first-class citizens.
**Triggers:** Designing autonomous agents, MCP tools, self-modifying systems

### /andrew-kane-gem-writer
Write Ruby gems following Andrew Kane's proven patterns.
**Triggers:** "create a gem", "write a Ruby library", "design a gem API"

### /compound-docs
Capture solved problems as categorized documentation with YAML frontmatter.
**Triggers:** Documentation tasks, knowledge capture

### /create-agent-skills
Expert guidance for creating Claude Code Skills.
**Triggers:** Working with SKILL.md files, authoring skills

### /dhh-rails-style
Write Ruby and Rails code in DHH's distinctive 37signals style.
**Triggers:** Ruby/Rails code generation, mentions of DHH/Basecamp/HEY

### /dspy-ruby
Work with DSPy.rb framework for building type-safe LLM applications.
**Triggers:** Implementing AI features, creating LLM modules, agent systems

### /every-style-editor
Review or edit copy to ensure adherence to Every's style guide.
**Triggers:** Copy review, editorial tasks

### /file-todos
Manage file-based todo tracking system in todos/ directory.
**Triggers:** Todo management, task tracking

### /frontend-design
Create distinctive, production-grade frontend interfaces.
**Triggers:** Build web components, pages, applications

### /gemini-imagegen
Generate and edit images using Gemini API (Nano Banana Pro).
**Triggers:** "generate image", "edit image", "create logo", "make sticker"

### /git-worktree
Manage Git worktrees for isolated parallel development.
**Triggers:** Git worktree operations, parallel development

### /rclone
Upload, sync, and manage files across cloud storage providers.
**Triggers:** "upload to S3", "sync to cloud", "backup files", cloud storage

### /skill-creator
Guide for creating effective skills that extend Claude capabilities.
**Triggers:** Creating/updating skills with specialized knowledge

---

## Ralph-Wiggum Commands

### /ralph-loop
Start autonomous loop execution until task complete.
```bash
/ralph-loop "Build REST API for todos" --max-iterations 20
/ralph-loop "Implement feature X" --completion-promise "DONE"
```

**Parameters:**
- `--max-iterations N` - Safety limit (REQUIRED)
- `--completion-promise "TEXT"` - Exact completion string

**How it works:**
1. You run once
2. Claude works, tries to exit
3. Stop hook blocks exit, re-feeds prompt
4. Repeats until done or max iterations

### /ralph-cancel (or /cancel-ralph)
Cancel the active Ralph loop.
```bash
/ralph-cancel
```

### /ralph-help (or /help)
Show Ralph-Wiggum plugin help.
```bash
/help
```

---

## Quick Reference by Category

### Bug Fixing
- `/fix` (quick) → `/debug` (systematic) → `/reproduce-bug` (investigation)

### Code Quality
- `/review` (quick) → `/refactor` (simplify) → `/plan_review` (thorough)

### Planning
- `/plan` (basic) → `/think` (deep reasoning) → `/deepen-plan` (enriched)

### Feature Implementation
- `/fix` (simple) → `/build` (parallel) → `/sprint` (autonomous) → `/ralph-loop` (continuous)

### Testing
- `/test` (unit/integration) → `/test-browser` (E2E) → `/xcode-test` (iOS)

### Documentation
- `/changelog` (releases) → `/compound-docs` (knowledge) → `/deploy-docs` (publish)

### Memory & Knowledge
- `/memory` (manual) → `/compound-docs` (structured) → `/triage` (prioritize)

### Parallelization
- `/parallel` (custom agents) → `/build` (feature split) → `/resolve_parallel` (todos)
- `/resolve_pr_parallel` (PR comments) → `/resolve_todo_parallel` (CLI todos)

### Autonomous Workflows
- `/sprint` (Ralph pattern with PRD) → `/ralph-loop` (continuous iteration) → `/lfg` (full auto)
- `/work` (execute plans) → `/compound` (document learnings) → `/review` (validate)

---

## Command Complexity Matrix

| Complexity | Time | Commands |
|------------|------|----------|
| **Instant** | <1min | /fix, /commit, /ship, /ralph-cancel |
| **Fast** | 1-5min | /review, /refactor, /search, /explore |
| **Moderate** | 5-15min | /think, /plan, /debug, /browser, /test |
| **Slow** | 15-30min | /build, /parallel, /plan_review, /reproduce-bug |
| **Very Slow** | 30min+ | /sprint, /ralph-loop, /lfg, /work, /compound/review workflows |

---

## Agent Utilization

| Agents | Commands |
|--------|----------|
| **0** | /fix, /commit, /memory, /search |
| **1** | /review, /refactor, /think, /debug |
| **2-3** | /plan, /test, /security, /browser |
| **3-5** | /build, /parallel, /plan_review |
| **5+** | /resolve_parallel, /resolve_pr_parallel, /lfg |
| **Variable** | /sprint, /ralph-loop, /work, /compound/plan/review workflows |

---

## Skills Auto-Activation

Skills activate automatically when their trigger patterns are detected:

| Skill | Auto-Triggers |
|-------|---------------|
| agent-browser | "browse", "screenshot", "fill form" |
| dhh-rails-style | Rails code, mentions "DHH", "37signals" |
| andrew-kane-gem-writer | "create gem", "Ruby library" |
| frontend-design | "build component", "create page" |
| gemini-imagegen | "generate image", "create logo" |
| dspy-ruby | "LLM application", "AI feature" |
| every-style-editor | Copy review, editorial tasks |
| git-worktree | Git worktree operations |
| rclone | Cloud storage, "upload to S3" |

---

## Philosophy & Best Practices

### Progressive Disclosure
1. Start simple: `/fix`, `/commit`
2. Add complexity: `/think`, `/plan` for hard problems
3. Go parallel: `/build` when feature has independent parts
4. Go autonomous: `/sprint`, `/ralph-loop` only for multi-day work

### Safety First
- ALWAYS set `--max-iterations` with Ralph loops
- Use `/ralph-cancel` if loop goes wrong
- Test in branches before main
- Review quality gates before committing

### Memory Management
- **No auto-capture** - Save explicitly with `/memory save`
- **No pollution** - Only save valuable insights
- **File-based** - Git-tracked in `.claude/memory/`

### When to Use What

**Quick bug?** → `/fix`
**Code smell?** → `/refactor`
**Complex problem?** → `/think` first, then `/plan`
**Large feature?** → `/plan` → `/build` (parallel)
**Multi-story epic?** → `/sprint` with PRD
**Continuous iteration?** → `/ralph-loop` with limits
**Full autonomous?** → `/lfg` (use sparingly)

---

## Sources

- [Compound-Engineering Plugin](https://github.com/EveryInc/compound-engineering-plugin)
- [Ralph-Wiggum Plugin](https://github.com/anthropics/claude-code/tree/main/plugins/ralph-wiggum)
- Template Custom Commands: `.claude/commands/`

---

**Total Command Count: 66**
- ✅ 26 Template Commands
- ✅ 23 Compound-Engineering Commands
- ✅ 14 Compound-Engineering Skills
- ✅ 3 Ralph-Wiggum Commands

