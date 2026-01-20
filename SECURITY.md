# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in this template, please report it responsibly:

1. **Do NOT** open a public issue
2. Email the maintainer directly or use GitHub's private vulnerability reporting
3. Include:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact

## Response Timeline

- **Acknowledgment**: Within 48 hours
- **Initial assessment**: Within 1 week
- **Fix timeline**: Depends on severity

## Scope

This template contains configuration files, not application code. Security concerns typically involve:

- Exposed secrets in example files
- Unsafe default permissions
- Vulnerable MCP server configurations
- Hook scripts with security issues

## Best Practices for Users

1. **Never commit `.env` files** - They're gitignored for a reason
2. **Review hook scripts** before enabling them
3. **Audit MCP servers** you enable - they have system access
4. **Keep permissions minimal** in settings.json
