# Rule: Security Standards

## OWASP Top 10 Compliance
All code MUST be validated against the OWASP Top 10:

### 1. Broken Access Control
- ✓ Verify authorization on every request
- ✓ Deny by default
- ✓ Validate permissions server-side
- ✗ Never trust client-side checks

### 2. Cryptographic Failures
- ✓ Encrypt sensitive data at rest and in transit
- ✓ Use modern algorithms (AES-256, RSA-2048+)
- ✓ Store passwords with bcrypt/argon2 (never plain text)
- ✗ Never use MD5, SHA-1, or custom crypto

### 3. Injection
- ✓ Use parameterized queries for SQL
- ✓ Sanitize and validate ALL user input
- ✓ Use ORM/query builders properly
- ✗ Never concatenate user input into queries

### 4. Insecure Design
- ✓ Threat model before implementation
- ✓ Implement rate limiting
- ✓ Use established security patterns
- ✗ Don't roll your own authentication

### 5. Security Misconfiguration
- ✓ Disable debug mode in production
- ✓ Remove default credentials
- ✓ Keep dependencies updated
- ✗ Never commit credentials

### 6. Vulnerable Components
- ✓ Regularly update dependencies
- ✓ Use `npm audit` / `pip check` / equivalent
- ✓ Review CVE databases
- ✗ Don't ignore security warnings

### 7. Authentication Failures
- ✓ Implement multi-factor authentication
- ✓ Use secure session management
- ✓ Rate limit login attempts
- ✗ Never expose session IDs in URLs

### 8. Software and Data Integrity Failures
- ✓ Verify digital signatures
- ✓ Use integrity checks (SRI for CDNs)
- ✓ Validate deserialized objects
- ✗ Don't trust untrusted sources

### 9. Security Logging Failures
- ✓ Log authentication events
- ✓ Log access control failures
- ✓ Monitor for suspicious patterns
- ✗ Don't log sensitive data (passwords, tokens)

### 10. Server-Side Request Forgery (SSRF)
- ✓ Validate and sanitize URLs
- ✓ Whitelist allowed domains
- ✓ Disable URL redirects when possible
- ✗ Don't allow arbitrary URL fetching

## Secrets Management

### Forbidden Files
NEVER read or commit:
- `.env`, `.env.*`
- `secrets.json`, `credentials.json`
- `*.pem`, `*.key`, `*.p12`, `*.pfx`
- `id_rsa`, `id_ed25519`
- Any file containing API keys, tokens, or passwords

### Secrets Detection
Pre-commit hook MUST scan for:
- AWS keys: `AKIA[0-9A-Z]{16}`
- Private keys: `-----BEGIN (RSA|OPENSSH|PRIVATE) KEY-----`
- Generic secrets: `(password|secret|token).*=.*['"]\w+['"]`
- JWT tokens: `eyJ[A-Za-z0-9-_=]+\.eyJ[A-Za-z0-9-_=]+\.[A-Za-z0-9-_.+/=]*`

### Proper Secrets Storage
✓ Environment variables (`.env` gitignored)
✓ Secret management services (Vault, AWS Secrets Manager)
✓ Encrypted configuration files
✗ Hardcoded in source code
✗ Committed to git
✗ Stored in plain text

## Input Validation

### All User Input MUST Be
1. **Type checked** - Verify expected data type
2. **Length validated** - Enforce min/max bounds
3. **Format validated** - Use regex for patterns
4. **Sanitized** - Remove/escape dangerous characters
5. **Contextually encoded** - HTML entities, SQL escaping, etc.

### Validation Examples

**Good:**
```typescript
// Parameterized query
db.query('SELECT * FROM users WHERE id = ?', [userId]);

// Input validation
const email = validator.isEmail(input) ? input : null;

// XSS prevention
res.send(escape(userInput));
```

**Bad:**
```typescript
// SQL injection vulnerable
db.query(`SELECT * FROM users WHERE id = ${userId}`);

// No validation
const email = req.body.email; // Danger!

// XSS vulnerable
res.send(`<div>${userInput}</div>`);
```

## Authentication & Authorization

### Authentication Requirements
- ✓ Use industry-standard protocols (OAuth 2.0, OIDC)
- ✓ Implement secure session management
- ✓ Hash passwords with salt (bcrypt, argon2)
- ✓ Rate limit authentication attempts
- ✓ Require strong passwords (min 12 chars, complexity)

### Authorization Requirements
- ✓ Check permissions on every request
- ✓ Use role-based access control (RBAC)
- ✓ Deny by default, allow explicitly
- ✓ Validate resource ownership
- ✓ Implement principle of least privilege

## API Security

### Required Headers
```
Content-Security-Policy: default-src 'self'
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Strict-Transport-Security: max-age=31536000
```

### Rate Limiting
- ✓ Implement per-IP rate limits
- ✓ More restrictive on auth endpoints
- ✓ Return 429 Too Many Requests
- ✓ Use exponential backoff

### CORS Configuration
- ✓ Whitelist specific origins
- ✓ Don't use `*` in production
- ✓ Validate Origin header
- ✗ Never reflect arbitrary origins

## Enforcement

### Pre-Commit Security Scan
```bash
# Secrets detection
git diff --cached | grep -E "(password|secret|key|token).*=.*['\"][^'\"]{8,}"

# Dependency vulnerabilities
npm audit --audit-level=moderate

# Static analysis
npm run lint:security
```

### Responsible Agents
- **security agent**: Reviews all security-sensitive code
- **reviewer agent**: Validates security in PRs
- **architect agent**: Makes security architecture decisions

### Security Review Triggers
Security agent MUST review when code touches:
- Authentication/authorization
- User input handling
- Database queries
- File system operations
- External API calls
- Cryptographic operations
- Session management
- Payment processing

## Common Vulnerabilities to Avoid

### Command Injection
```typescript
// Bad
exec(`ping ${userInput}`);

// Good
execFile('ping', [userInput]);
```

### Path Traversal
```typescript
// Bad
res.sendFile(userInput);

// Good
const safePath = path.join(SAFE_DIR, path.basename(userInput));
res.sendFile(safePath);
```

### XML External Entity (XXE)
```typescript
// Bad
const parser = new XMLParser();

// Good
const parser = new XMLParser({ 
  allowExternalEntities: false 
});
```

### Insecure Deserialization
```typescript
// Bad
const obj = eval(userInput);

// Good
const obj = JSON.parse(userInput);
// + validate against schema
```

## Security Testing

### Required Security Tests
- [ ] Authentication bypass attempts
- [ ] Authorization boundary tests
- [ ] SQL injection attempts
- [ ] XSS payload tests
- [ ] CSRF token validation
- [ ] Rate limiting verification
- [ ] Secrets scanning (pre-commit)

### Penetration Testing
- Schedule annual penetration tests
- Fix critical findings within 30 days
- Document all findings and remediations

## Incident Response

### Security Incident Process
1. **Detect** - Monitor logs for suspicious activity
2. **Contain** - Isolate affected systems
3. **Investigate** - Root cause analysis
4. **Remediate** - Fix vulnerability
5. **Document** - Post-mortem report

### When to Escalate
- Suspected data breach
- Credential compromise
- Production vulnerability exploitation
- Regulatory compliance violation

## Success Metrics
- [ ] Zero critical vulnerabilities in production
- [ ] All OWASP Top 10 addressed
- [ ] No secrets in git history
- [ ] Security review on all sensitive code
- [ ] Dependencies updated monthly
- [ ] Security tests passing
