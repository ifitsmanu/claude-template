# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [1.0.0] - 2025-01-20

### Added
- 14 slash commands for common workflows
  - `/plan` - Feature planning with extended thinking
  - `/fix` - Bug fixing with root cause analysis
  - `/test` - Test coverage analysis
  - `/commit-push-pr` - Full commit workflow
  - `/review` - Code review
  - `/think` - Deep analysis (32k tokens)
  - `/parallel` - Multi-agent implementation
  - `/security` - Security scanning
  - `/refactor` - Code refactoring
  - `/explore` - Codebase exploration
  - `/research` - Web research
  - `/browser` - Browser testing
  - `/search` - Code search
  - `/commit` - Simple commit

- 5 custom agents
  - `code-reviewer` - Security and quality review (Sonnet)
  - `code-simplifier` - Post-implementation cleanup (Sonnet)
  - `test-writer` - Test generation (Haiku)
  - `explorer` - Codebase mapping (Haiku)
  - `verify-app` - Pre-commit verification (Haiku)

- 6 MCP servers pre-configured
  - sequential-thinking (free)
  - context7 (free)
  - exa (freemium)
  - jina (freemium)
  - playwright (free)
  - filesystem (free)

- Auto-formatting hooks
  - format-on-save.sh (Prettier, Ruff, gofmt, rustfmt, rubocop)
  - pre-commit.sh (tests, secret scanning)

- CI/CD workflows
  - JSON/YAML validation
  - Secret scanning
  - Markdown linting
  - Auto-release on tags

- Documentation
  - README with Boris Cherny workflow
  - PLUGINS.md with MCP installation guide
  - CONTRIBUTING.md
  - Progressive disclosure via agent_docs/

### Security
- Deny rules for dangerous commands
- Secret file patterns blocked by default
- Pre-commit secret scanning
