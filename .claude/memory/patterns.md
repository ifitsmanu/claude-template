# Codebase Patterns

Permanent record of conventions and patterns in this codebase. Update when new patterns are established.

---

## Naming Conventions

<!-- Add your naming patterns here -->
<!-- Example: -->
<!-- - Files: kebab-case (user-service.ts) -->
<!-- - Functions: camelCase (getUserById) -->
<!-- - Classes: PascalCase (UserService) -->
<!-- - Constants: SCREAMING_SNAKE (MAX_RETRIES) -->

---

## Architecture Patterns

<!-- Add architectural patterns here -->
<!-- Example: -->
<!-- - Services handle business logic, controllers handle HTTP -->
<!-- - Use dependency injection for testability -->
<!-- - Repository pattern for data access -->

---

## Error Handling

<!-- Add error handling patterns here -->
<!-- Example: -->
<!-- - All errors extend BaseError class -->
<!-- - HTTP errors return consistent format: { error: { code, message, details } } -->
<!-- - Log errors with context before throwing -->

---

## Testing Patterns

### Coverage Requirements
- Minimum 80% test coverage (statements, branches, functions, lines)
- All three test types required: Unit, Integration, E2E

### TDD Workflow
- Follow RED → GREEN → IMPROVE → VERIFY cycle
- Write failing test first (RED)
- Implement minimal code to pass (GREEN)
- Refactor for quality (IMPROVE)
- Verify 80% coverage (VERIFY)
- Consult tdd-guide skill for new features

### Test Organization
- Unit tests: `tests/unit/` or `__tests__/` (isolated, mocked dependencies)
- Integration tests: `tests/integration/` (real dependencies, test DB)
- E2E tests: `tests/e2e/` (Playwright, critical user journeys only)

### Test Quality
- Test behavior, not implementation
- Use descriptive names: `should_X_when_Y`
- One assertion concept per test
- Arrange-Act-Assert structure
- Tests must be deterministic (no flaky tests)

### E2E Best Practices
- Use data-testid attributes for stability
- Focus on critical user journeys
- Keep tests <30 seconds each
- Screenshot failures automatically
- Test in all 3 browsers for critical paths

---

## API Patterns

<!-- Add API patterns here -->
<!-- Example: -->
<!-- - REST endpoints: /api/v1/[resource] -->
<!-- - Use plural nouns for collections -->
<!-- - Return 201 for creation, 200 for updates -->

---

## State Management

<!-- Add state patterns here -->
<!-- Example: -->
<!-- - Use React Context for global state -->
<!-- - Keep component state local when possible -->
<!-- - Use SWR for server state -->

---

## Security Patterns

<!-- Add security patterns here -->
<!-- Example: -->
<!-- - Validate all inputs at API boundary -->
<!-- - Use parameterized queries, never string concatenation -->
<!-- - Hash passwords with bcrypt, cost factor 12 -->

---

## Performance Patterns

<!-- Add performance patterns here -->
<!-- Example: -->
<!-- - Index all foreign keys -->
<!-- - Use connection pooling -->
<!-- - Cache expensive computations -->

---

<!-- 
HOW TO USE:
1. When you discover a pattern, add it to the appropriate section
2. Keep patterns concise - one line per pattern
3. Include rationale if non-obvious
4. Remove patterns that are no longer valid
5. This file is permanent - think before adding
-->
