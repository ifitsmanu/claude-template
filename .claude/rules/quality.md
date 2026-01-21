# Rule: Code Quality Standards

## Coding Principles

### KISS - Keep It Simple, Stupid
- ✓ Simple solutions over clever ones
- ✓ Readable code over compact code
- ✓ Explicit over implicit
- ✗ Premature optimization
- ✗ Over-engineering for hypothetical needs

### DRY - Don't Repeat Yourself
- ✓ Extract reusable logic to functions
- ✓ Use shared utilities
- ✓ But: 3 similar lines beats premature abstraction
- ✗ Don't abstract before pattern emerges

### YAGNI - You Aren't Gonna Need It
- ✓ Implement what's needed NOW
- ✓ Don't build for hypothetical requirements
- ✓ Refactor when actual needs emerge
- ✗ Feature flags for unused features
- ✗ Configuration for non-existent use cases

## Code Standards

### Function Size
- **Target:** <50 lines per function
- **Maximum:** 100 lines (rare exceptions only)
- **If larger:** Break into smaller functions with clear names

### Nesting Depth
- **Maximum:** 3 levels deep
- **Use:** Early returns to reduce nesting
- **Refactor:** Extract nested logic to functions

### File Size
- **Target:** <300 lines per file
- **Maximum:** 500 lines (consider splitting)
- **Exception:** Generated code, type definitions

### Complexity
- **Cyclomatic complexity:** <10 per function
- **Use:** Switch statements sparingly
- **Prefer:** Polymorphism or lookup tables

## Naming Conventions

### Files
| Type | Convention | Example |
|------|------------|---------|
| Components | PascalCase | UserProfile.tsx |
| Utilities | kebab-case | date-formatter.ts |
| Tests | match source | user-service.test.ts |
| Config | lowercase | .eslintrc.json |

### Code
| Type | Convention | Example |
|------|------------|---------|
| Variables | camelCase | userId |
| Functions | camelCase | getUserById |
| Classes | PascalCase | UserService |
| Constants | SCREAMING_SNAKE | MAX_RETRIES |
| Private | _prefix | _internalMethod |
| Types | PascalCase | UserProfile |
| Interfaces | PascalCase | IUserRepository |
| Enums | PascalCase | UserRole |

### Naming Rules
- ✓ Descriptive names (no `data`, `info`, `temp`)
- ✓ Pronounceable names (no `usrMgmt`)
- ✓ Searchable names (no single letters except loops)
- ✓ Verbs for functions: `getUser`, `validateEmail`
- ✓ Nouns for variables: `user`, `emailAddress`
- ✗ Abbreviations (except common: `id`, `url`, `api`)
- ✗ Hungarian notation (no `strName`, `iCount`)

## Comments

### When to Comment
- ✓ WHY, not WHAT (code explains what)
- ✓ Non-obvious business rules
- ✓ Workarounds for external bugs
- ✓ Performance optimizations rationale
- ✓ TODO with ticket reference

### When NOT to Comment
- ✗ Obvious code (don't comment `// increment i`)
- ✗ Code you just wrote (make code self-explanatory)
- ✗ Commented-out code (delete it, git remembers)
- ✗ Redundant JSDoc (if types tell the story)

### Good Comments
```typescript
// WORKAROUND: API returns null instead of 404 (bug #1234)
const user = data ?? { id: 0, name: 'Unknown' };

// Batch size tuned for memory constraints on serverless
const BATCH_SIZE = 100;
```

### Bad Comments
```typescript
// Get user by ID
function getUserById(id: number) { ... }

// i++; // Increment counter
```

## Error Handling

### Validation Location
- ✓ Validate at system boundaries (API, user input)
- ✓ Trust internal code and framework guarantees
- ✗ Don't validate every function parameter internally

### Error Handling Strategy
- ✓ Fail fast with clear error messages
- ✓ Use exceptions for exceptional cases
- ✓ Return errors for expected failures
- ✗ Silent failures (log then throw/return)
- ✗ Catch-all empty handlers

### Error Information
```typescript
// Good: Specific, actionable error
throw new ValidationError('Email must be valid format', { 
  field: 'email', 
  value: email 
});

// Bad: Generic, no context
throw new Error('Invalid input');
```

## Code Organization

### File Structure
```typescript
// 1. Imports (grouped: external, internal, types)
import { useState } from 'react';
import { getUserById } from '@/services/user';
import type { User } from '@/types';

// 2. Constants
const MAX_RETRIES = 3;

// 3. Types (if not imported)
type UserProfile = { ... };

// 4. Main logic
export function UserComponent() { ... }

// 5. Helper functions (or extract to separate file)
function formatUserName(name: string) { ... }
```

### Import Organization
```typescript
// External dependencies
import React from 'react';
import { format } from 'date-fns';

// Internal modules
import { api } from '@/lib/api';
import { Button } from '@/components/ui';

// Types
import type { User } from '@/types';
```

## Git Commit Standards

### Commit Message Format
```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Formatting (no code change)
- `refactor`: Code change (no feature/fix)
- `perf`: Performance improvement
- `test`: Add/update tests
- `chore`: Build/tooling changes

### Examples
```
feat(auth): add OAuth 2.0 support

Implement OAuth 2.0 authentication flow with Google and GitHub providers.
Includes token refresh logic and session management.

Closes #123

---

fix(api): handle null response from user service

API was returning 500 instead of 404 when user not found.
Added null check and proper error handling.

---

refactor(utils): extract date formatting to helper

Reduced duplication across components by creating shared formatDate utility.
```

### Commit Rules
- ✓ Present tense: "add feature" not "added feature"
- ✓ Lowercase subject
- ✓ No period at end of subject
- ✓ Subject line <50 chars
- ✓ Body wrapped at 72 chars
- ✗ Generic messages: "fix bug", "update code"

## Code Review Standards

### Before Requesting Review
- [ ] Code runs locally without errors
- [ ] Tests pass (all three types)
- [ ] Linter passes
- [ ] No commented-out code
- [ ] No debug statements (console.log)
- [ ] Self-reviewed diff

### What Reviewers Check
1. **Correctness** - Does it solve the problem?
2. **Security** - Any vulnerabilities?
3. **Testing** - Adequate test coverage?
4. **Readability** - Easy to understand?
5. **Performance** - Any bottlenecks?
6. **Maintainability** - Easy to change later?

## Anti-Patterns to Avoid

### Magic Numbers
```typescript
// Bad
if (user.age > 18) { ... }

// Good
const LEGAL_AGE = 18;
if (user.age > LEGAL_AGE) { ... }
```

### God Objects
```typescript
// Bad: One class does everything
class UserManager {
  authenticate() { ... }
  validate() { ... }
  sendEmail() { ... }
  generateReport() { ... }
}

// Good: Single responsibility
class UserAuthenticator { ... }
class UserValidator { ... }
class EmailService { ... }
```

### Premature Abstraction
```typescript
// Bad: Abstract before pattern emerges
class AbstractUserFactoryBuilderStrategy { ... }

// Good: Keep simple until needed
function createUser(data: UserData): User { ... }
```

### Boolean Parameters
```typescript
// Bad
sendEmail(user, true, false, true);

// Good
sendEmail(user, { 
  notify: true, 
  async: false, 
  html: true 
});
```

## Enforcement

### Pre-Commit Checks
```bash
npm run lint        # ESLint, Prettier
npm run typecheck   # TypeScript
npm test            # All tests
npm run format      # Auto-format
```

### Responsible Agents
- **reviewer agent**: Enforces quality standards in PRs
- **builder agent**: Follows standards when writing code
- **architect agent**: Defines patterns and conventions

### Quality Gates
- [ ] Linter passes (zero warnings)
- [ ] Type checker passes
- [ ] All tests pass
- [ ] Code review approved
- [ ] No FIXME/TODO without ticket
- [ ] Functions <50 lines
- [ ] Nesting <3 levels

## Exceptions

### When to Break Rules
- **Performance critical code** - Document why
- **Third-party API constraints** - Add comment
- **Legacy code integration** - Isolate in adapter
- **Emergency hotfix** - Create tech debt ticket

### How to Request Exception
1. Document reason in PR description
2. Add comment in code explaining
3. Create follow-up ticket for cleanup
4. Get architect agent approval

## Success Metrics
- [ ] Zero linter warnings
- [ ] All functions <50 lines
- [ ] No commented-out code
- [ ] Descriptive variable names
- [ ] Clear commit messages
- [ ] Code review approval
