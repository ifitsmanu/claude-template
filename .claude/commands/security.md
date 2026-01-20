# Security Review

Perform security audit on: $ARGUMENTS

## Checklist (OWASP Top 10)
1. **Injection**: SQL, command, LDAP injection
2. **Broken Auth**: Weak passwords, session issues
3. **Sensitive Data**: Exposed secrets, weak crypto
4. **XXE**: XML external entity attacks
5. **Broken Access**: Privilege escalation
6. **Misconfig**: Debug modes, default creds
7. **XSS**: Reflected, stored, DOM-based
8. **Insecure Deserialization**: Object injection
9. **Vulnerable Components**: Outdated deps
10. **Logging**: Missing audit trails

## Output
Report findings with:
- Severity: Critical/High/Medium/Low
- Location: file:line
- Fix: Concrete remediation steps
