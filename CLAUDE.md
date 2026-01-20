# Project: [PROJECT_NAME]

## Stack
- Language: [TypeScript/Python/Go/Rust]
- Framework: [Next.js/FastAPI/Django/etc]
- Database: [PostgreSQL/MongoDB/etc]
- Package Manager: [bun/npm/uv/cargo]

## Structure
src/              # Source code
tests/            # Test files
agent_docs/       # Documentation (load with @agent_docs/file.md)
scripts/          # Build/deploy scripts

## Commands
dev:    [npm run dev / uv run dev]
test:   [npm test / pytest]
lint:   [npm run lint / ruff check]
build:  [npm run build / uv build]

## Rules
1. Run tests before committing
2. Check similar files before creating new ones
3. Keep changes minimal and focused
4. No comments unless logic is non-obvious
5. Prefer editing over creating files

## Forbidden
- Never read .env, secrets.json, *.pem
- Never rm -rf / or git push --force
- Never add deps without approval

## On-Demand Context
@agent_docs/architecture.md  # System design
@agent_docs/api.md           # API reference
@agent_docs/patterns.md      # Code patterns

## Multi-Agent Patterns
- Use Task tool with parallel agents for large searches
- Use subagents for isolated tasks (review, explore, test)
- Chain agents: Plan -> Implement -> Test -> Review
- Each agent gets own context window - use for large codebases
