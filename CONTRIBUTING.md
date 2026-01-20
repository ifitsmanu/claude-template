# Contributing

Thanks for wanting to improve the template.

## How to Contribute

1. **Fork** the repo
2. **Create a branch** for your change
3. **Make your changes**
4. **Test** that JSON/YAML files are valid
5. **Submit a PR**

## What We're Looking For

- New useful commands (`.claude/commands/`)
- New agents for common tasks (`.claude/agents/`)
- MCP server recommendations (`PLUGINS.md`)
- Bug fixes in existing configs
- Documentation improvements

## Guidelines

### Commands

- Keep them focused on one task
- Include clear step-by-step instructions
- Use `$ARGUMENTS` for user input

### Agents

- Set appropriate `model` (haiku for simple, sonnet for complex)
- List only needed `tools`
- Write clear, specific prompts

### Config Files

- Validate JSON: `python3 -c "import json; json.load(open('file.json'))"`
- Validate YAML: `python3 -c "import yaml; yaml.safe_load(open('file.yml'))"`
- Never commit real API keys or secrets

## Questions?

Open an issue. We're happy to help.
