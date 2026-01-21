# Learnings

Insights from debugging, implementation, and iteration. Prune entries older than 30 days unless promoted to patterns.

---

<!--
TEMPLATE FOR NEW LEARNINGS:

## [YYYY-MM-DD] - [Brief Title]

**Context**: [When does this apply?]

**Learning**: [What was learned?]

**Tags**: [category, tags, for, search]

---
-->

<!-- EXAMPLE LEARNINGS:

## 2024-01-20 - Database Connection Pool Exhaustion

**Context**: Random 500 errors during traffic peaks

**Learning**: Connection pool exhaustion presents as intermittent 500 errors that self-heal. Symptoms: errors spike at peak, recover after minutes. Fix: pool size = workers × 2, add 5s checkout timeout. Monitor pool metrics.

**Tags**: database, performance, debugging

---

## 2024-01-18 - React useEffect Cleanup Race Condition

**Context**: Component unmounts before async operation completes

**Learning**: Always use cleanup function with cancelled flag for async useEffect. Check flag before setState to prevent "update on unmounted component" warning.

**Tags**: react, frontend, async

---

## 2024-01-15 - JWT Token Refresh Edge Case

**Context**: Users logged out unexpectedly

**Learning**: Token refresh was racing with concurrent requests. Multiple 401s would each trigger refresh, causing token invalidation. Fix: Queue refresh requests and reuse pending promise.

**Tags**: auth, jwt, race-condition

---
-->

<!-- Add your learnings below this line -->
<!-- Remember: Prune entries older than 30 days unless valuable enough to promote to patterns -->
