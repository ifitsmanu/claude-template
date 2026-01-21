# Rule: Testing Standards

## Coverage Requirement
Maintain a minimum of **80% test coverage** across the codebase.

## Required Test Types
All three categories MUST be implemented:

### Unit Tests
- Test isolated functions, utilities, and components
- Mock external dependencies
- Fast execution (<100ms per test)
- Located in: `tests/unit/` or `__tests__/`

### Integration Tests
- Cover API endpoints and database operations
- Test component interactions
- Use test databases/containers
- Located in: `tests/integration/`

### E2E Tests
- Validate critical user workflows
- Use Playwright for browser automation
- Cover happy paths and key error scenarios
- Located in: `tests/e2e/`

## Test-Driven Development Workflow

### Mandatory TDD Cycle
1. **RED** - Write failing test first
2. **GREEN** - Implement minimal code to pass
3. **IMPROVE** - Refactor for quality
4. **VERIFY** - Confirm 80% coverage threshold

### Example TDD Flow
```bash
# 1. RED - Write test
npm test -- user-service.test.ts  # Should fail

# 2. GREEN - Implement
# Write code in src/user-service.ts

# 3. IMPROVE - Refactor
# Clean up implementation

# 4. VERIFY - Check coverage
npm run test:coverage
```

## Failure Resolution Guidelines

### When Tests Fail
1. **First:** Consult the tdd-guide skill or tester agent
2. **Check:** Tests run independently (no shared state)
3. **Validate:** Mocks accurately reflect real behavior
4. **Fix:** Implementation code, NOT tests (unless tests are wrong)

### When Coverage Is Below 80%
1. **Identify** uncovered lines: `npm run test:coverage`
2. **Add tests** for uncovered code paths
3. **Don't skip** edge cases to inflate coverage

## Enforcement

### Pre-Commit Gate
Tests MUST pass before committing:
```bash
npm test || exit 1
npm run lint || exit 1
npm run test:coverage -- --threshold=80 || exit 1
```

### Responsible Agents
- **tester agent**: Writes tests, validates coverage
- **tdd-guide skill**: Enforces RED → GREEN → IMPROVE
- **reviewer agent**: Validates test quality in PRs

## Exceptions

### When 80% Coverage Not Required
- Proof of concept code (clearly marked)
- Configuration files
- Type definitions only
- Deprecated code scheduled for removal

### When TDD Can Be Skipped
- Bug fixes with existing test coverage
- Documentation-only changes
- Emergency hotfixes (but add tests after)

## Test Quality Standards

### Good Tests
- ✓ Test behavior, not implementation
- ✓ One assertion concept per test
- ✓ Clear test names: `should_returnUser_when_validIdProvided`
- ✓ Arrange-Act-Assert structure
- ✓ Independent (can run in any order)

### Bad Tests
- ✗ Test private methods directly
- ✗ Multiple unrelated assertions
- ✗ Unclear names: `test1`, `testUser`
- ✗ Shared state between tests
- ✗ Depend on test execution order

## Agent Consultation

### Use tdd-guide skill when:
- Starting a new feature
- Unsure of test structure
- Coverage threshold not met
- Tests failing consistently

### Use tester agent when:
- Writing test suites
- Refactoring tests
- Improving coverage
- Debugging test failures

### Use e2e-runner agent when:
- Writing Playwright tests
- Testing user workflows
- Browser automation needed
- Cross-browser validation

## Success Metrics
- [ ] 80%+ test coverage
- [ ] All tests passing
- [ ] All three test types present
- [ ] Tests run in <30 seconds (unit)
- [ ] TDD workflow followed for new features
