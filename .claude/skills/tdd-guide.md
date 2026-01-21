# Skill: Test-Driven Development Guide

## Purpose
Enforces RED → GREEN → IMPROVE cycle for all new features and significant changes.

## When to Use This Skill
- Implementing new features
- Adding new functions or modules
- Refactoring with changed behavior
- Bug fixes that need test coverage
- When coverage drops below 80%

## The TDD Cycle

### Phase 1: RED - Write Failing Test
**Goal:** Create test that fails because feature doesn't exist yet

```typescript
// Example: tests/user-service.test.ts
describe('UserService', () => {
  describe('getUserById', () => {
    it('should return user when valid ID provided', async () => {
      const service = new UserService();
      const user = await service.getUserById(1);
      
      expect(user).toBeDefined();
      expect(user.id).toBe(1);
      expect(user.name).toBeTruthy();
    });
  });
});
```

**Run test to confirm RED:**
```bash
npm test -- user-service.test.ts
# Should fail with "getUserById is not defined"
```

**Checklist:**
- [ ] Test describes the desired behavior
- [ ] Test is specific and focused
- [ ] Test actually fails (run it!)
- [ ] Failure message is clear

---

### Phase 2: GREEN - Implement Minimal Code
**Goal:** Make test pass with simplest implementation

```typescript
// src/user-service.ts
export class UserService {
  async getUserById(id: number): Promise<User> {
    // Minimal implementation to pass test
    const user = await db.users.findById(id);
    if (!user) throw new Error('User not found');
    return user;
  }
}
```

**Run test to confirm GREEN:**
```bash
npm test -- user-service.test.ts
# Should pass
```

**Checklist:**
- [ ] Test passes
- [ ] Implementation is minimal (no extra features)
- [ ] No premature optimization
- [ ] All existing tests still pass

---

### Phase 3: IMPROVE - Refactor
**Goal:** Clean up code while keeping tests green

**Refactoring opportunities:**
- Extract magic numbers to constants
- Improve variable names
- Extract repeated logic to functions
- Optimize performance if needed
- Add error handling
- Improve type safety

```typescript
// Refactored version
export class UserService {
  constructor(private db: Database) {}
  
  async getUserById(id: number): Promise<User> {
    this.validateId(id);
    return await this.fetchUser(id);
  }
  
  private validateId(id: number): void {
    if (!Number.isInteger(id) || id <= 0) {
      throw new ValidationError('Invalid user ID');
    }
  }
  
  private async fetchUser(id: number): Promise<User> {
    const user = await this.db.users.findById(id);
    if (!user) {
      throw new NotFoundError(`User ${id} not found`);
    }
    return user;
  }
}
```

**Run tests after each refactor:**
```bash
npm test -- user-service.test.ts
# Must stay green
```

**Checklist:**
- [ ] Code is more readable
- [ ] No duplication
- [ ] Better structure/organization
- [ ] Tests still pass
- [ ] No new functionality added

---

### Phase 4: VERIFY - Check Coverage
**Goal:** Ensure 80% coverage threshold met

```bash
npm run test:coverage
```

**Coverage report should show:**
```
File                | % Stmts | % Branch | % Funcs | % Lines |
--------------------|---------|----------|---------|---------|
user-service.ts     |   100   |   100    |   100   |   100   |
--------------------|---------|----------|---------|---------|
All files           |   85.2  |   82.1   |   87.4  |   84.8  |
```

**If below 80%:**
1. Identify uncovered lines
2. Add tests for those paths
3. Don't skip edge cases

---

## Test Types Required

### 1. Unit Tests (Isolated)
```typescript
// Mock external dependencies
describe('UserService - Unit', () => {
  let service: UserService;
  let mockDb: jest.Mocked<Database>;
  
  beforeEach(() => {
    mockDb = {
      users: {
        findById: jest.fn()
      }
    } as any;
    service = new UserService(mockDb);
  });
  
  it('should call database with correct ID', async () => {
    mockDb.users.findById.mockResolvedValue({ id: 1, name: 'Test' });
    
    await service.getUserById(1);
    
    expect(mockDb.users.findById).toHaveBeenCalledWith(1);
  });
});
```

### 2. Integration Tests (Real Dependencies)
```typescript
// Use test database
describe('UserService - Integration', () => {
  let service: UserService;
  let db: Database;
  
  beforeAll(async () => {
    db = await createTestDatabase();
    service = new UserService(db);
  });
  
  afterAll(async () => {
    await db.close();
  });
  
  it('should retrieve user from actual database', async () => {
    await db.users.create({ id: 1, name: 'Test User' });
    
    const user = await service.getUserById(1);
    
    expect(user.name).toBe('Test User');
  });
});
```

### 3. E2E Tests (Full System)
```typescript
// tests/e2e/user-flow.test.ts
describe('User Management - E2E', () => {
  it('should allow viewing user profile', async () => {
    await page.goto('/users/1');
    
    const name = await page.textContent('[data-testid="user-name"]');
    expect(name).toBe('Test User');
  });
});
```

---

## Common TDD Mistakes to Avoid

### ❌ Writing Tests After Code
```typescript
// WRONG: Code first, then test
class UserService {
  getUserById(id) { /* implementation */ }
}

// Test written after
it('should get user', () => { /* ... */ });
```

**Why wrong:** Miss edge cases, test what code does vs what it should do

### ✓ Write Test First
```typescript
// RIGHT: Test first defines behavior
it('should throw NotFoundError when user does not exist', async () => {
  await expect(service.getUserById(999))
    .rejects.toThrow(NotFoundError);
});

// Then implement
```

---

### ❌ Testing Implementation Details
```typescript
// WRONG: Testing how it works
it('should call getUserFromCache first', () => {
  const spy = jest.spyOn(service, 'getUserFromCache');
  service.getUserById(1);
  expect(spy).toHaveBeenCalled();
});
```

**Why wrong:** Brittle, breaks on refactoring

### ✓ Test Behavior/Outcomes
```typescript
// RIGHT: Testing what it does
it('should return cached user on second call', async () => {
  await service.getUserById(1);
  const start = Date.now();
  await service.getUserById(1); // Should be faster
  expect(Date.now() - start).toBeLessThan(10);
});
```

---

### ❌ Skipping Edge Cases
```typescript
// WRONG: Only happy path
it('should get user', async () => {
  const user = await service.getUserById(1);
  expect(user).toBeDefined();
});
```

**Why wrong:** 80% coverage requires edge cases

### ✓ Cover Edge Cases
```typescript
// RIGHT: Test error paths
describe('getUserById', () => {
  it('should return user for valid ID', async () => { /* ... */ });
  it('should throw when ID is negative', async () => { /* ... */ });
  it('should throw when ID is zero', async () => { /* ... */ });
  it('should throw when ID is not integer', async () => { /* ... */ });
  it('should throw when user not found', async () => { /* ... */ });
});
```

---

## Test Organization

### Arrange-Act-Assert Pattern
```typescript
it('should update user email', async () => {
  // ARRANGE - Set up test data
  const user = await createTestUser();
  const newEmail = 'new@example.com';
  
  // ACT - Perform action
  await service.updateEmail(user.id, newEmail);
  
  // ASSERT - Verify outcome
  const updated = await service.getUserById(user.id);
  expect(updated.email).toBe(newEmail);
});
```

### Test Naming Convention
```
should_<expected behavior>_when_<condition>
```

**Examples:**
- `should_returnUser_when_validIdProvided`
- `should_throwError_when_userNotFound`
- `should_hashPassword_when_creatingUser`

---

## TDD Workflow Summary

```
┌─────────────────────────────────────────┐
│ 1. RED: Write failing test             │
│    ├─ Describe expected behavior       │
│    ├─ Run test (must fail)             │
│    └─ Confirm clear failure message    │
└────────────┬────────────────────────────┘
             │
             ▼
┌─────────────────────────────────────────┐
│ 2. GREEN: Implement minimal code       │
│    ├─ Write simplest code to pass      │
│    ├─ Run test (must pass)             │
│    └─ No premature optimization        │
└────────────┬────────────────────────────┘
             │
             ▼
┌─────────────────────────────────────────┐
│ 3. IMPROVE: Refactor                   │
│    ├─ Clean up code                    │
│    ├─ Remove duplication               │
│    ├─ Run tests after each change      │
│    └─ Tests must stay green            │
└────────────┬────────────────────────────┘
             │
             ▼
┌─────────────────────────────────────────┐
│ 4. VERIFY: Check coverage              │
│    ├─ Run coverage report              │
│    ├─ Ensure 80%+ coverage             │
│    └─ Add tests for uncovered lines    │
└────────────┬────────────────────────────┘
             │
             ▼
        ┌─────────┐
        │ SUCCESS │
        └─────────┘
```

---

## Agent Integration

### When tester agent invokes this skill:
1. Confirms test-first approach
2. Runs tests after each phase
3. Validates 80% coverage
4. Reports phase completions

### Example flow:
```
tester: "Starting TDD cycle for getUserById"
tester: "Phase 1 (RED): Writing failing test... Done"
tester: "Running test... FAILED ✓ (expected)"
tester: "Phase 2 (GREEN): Implementing minimal code... Done"
tester: "Running test... PASSED ✓"
tester: "Phase 3 (IMPROVE): Refactoring... Done"
tester: "Running tests... PASSED ✓"
tester: "Phase 4 (VERIFY): Checking coverage... 85% ✓"
tester: "## Status: SUCCESS"
```

---

## Quick Reference

| Phase | Goal | Output | Duration |
|-------|------|--------|----------|
| RED | Failing test | Test file with ❌ | 2-5 min |
| GREEN | Passing test | Minimal code with ✓ | 5-10 min |
| IMPROVE | Clean code | Refactored with ✓ | 5-15 min |
| VERIFY | 80% coverage | Coverage report ✓ | 1-2 min |

**Total cycle:** 15-30 minutes per feature
**Repeat cycle** for each new function/behavior
