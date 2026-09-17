# PROMPT.md

# StoreOps Shift Handover Bulk Update

**Artifact Type:** Demonstration Feature Prompt  
**Reference Application:** StoreOps  
**Feature:** Shift Handover Bulk Activity Status Update  
**Requested API Contract:** `PATCH /api/activities/bulk-status`  
**Version:** 2.0  
**Status:** Ready for Planner Invocation

---

## 1. Purpose

Implement **Shift Handover Bulk Update** for the StoreOps reference application using the governed agentic delivery harness.

The requested capability allows authorized outgoing-shift staff to update multiple operational activities in one request.

The requested API contract is:

```text
PATCH /api/activities/bulk-status
```

The requested business behavior includes:

```text
Multiple Activity Updates
        +
Target Status = DONE or BLOCKED
        +
Per-Item Validation
        +
Partial-Failure Handling
        +
Audit Entry per Successful Update
```

This prompt defines the **business intent and expected outcomes** of the feature.

It does not define reusable harness orchestration, technology-specific implementation rules, governance thresholds, evaluation policy, transaction implementation, audit infrastructure, authorization implementation, deployment controls, or StoreOps architecture.

Those concerns are resolved through:

```text
CLAUDE.md
Active Harness Configuration
StoreOps Skills
Java/Spring Skills
Existing StoreOps Application
Approved Sprint Contracts
```

The Planner must inspect the active StoreOps configuration, domain rules, architecture rules, existing source, tests, API conventions, authorization behavior, and audit capabilities before determining the implementation approach.

---

## 2. Business Requirement

During shift handover, authorized outgoing-shift staff must be able to update multiple operational activities to:

```text
DONE
```

or:

```text
BLOCKED
```

in a single request.

Each requested activity update must have an independently traceable outcome.

The feature must support partial-failure behavior where compatible with existing StoreOps transaction and API conventions.

Each successfully updated activity must produce the audit evidence required by the existing StoreOps audit contract.

The implementation must preserve existing activity lifecycle, authorization, error handling, module ownership, and backward compatibility.

---

## 2.1 Requested API Contract

The requested API is:

```text
PATCH /api/activities/bulk-status
```

The Planner must validate this method and path against the existing StoreOps Activities API.

The Planner must determine:

```text
Existing Activities Base Path
Existing PATCH Conventions
Existing Bulk-Operation Conventions
Request DTO Convention
Response DTO Convention
Validation Convention
Error-Response Convention
API Versioning Convention
```

If the requested contract conflicts with an established StoreOps API convention or existing endpoint, the Planner must:

1. document the conflict;
2. identify the existing compatible convention;
3. describe the backward-compatibility impact;
4. propose the smallest compatible contract; and
5. surface the decision for human approval.

The Planner must not silently rename, replace, or duplicate an existing API.

---

## 2.2 Activity Status Semantics

The requested business scope is limited to:

```text
DONE
BLOCKED
```

The Planner must verify from repository evidence:

- whether `DONE` and `BLOCKED` are authoritative StoreOps activity states;
- their actual representation;
- valid source states for each transition;
- prohibited transitions;
- whether transition rules depend on activity type, role, store, department, or other context;
- whether status changes trigger existing application behavior; and
- whether equivalent existing states must be considered.

The implementation must not invent a new activity lifecycle or status model.

---

## 2.3 Bulk Request Semantics

The request must represent multiple activity-status updates.

For each item, StoreOps must be able to determine:

```text
Activity Identifier
Requested Target Status
Other Existing Required Context
```

The Planner must determine:

```text
Request DTO
Response DTO
Maximum Batch Size
Minimum Batch Size
Duplicate-Identifier Behavior
Request Ordering
Response Ordering
Empty-Request Behavior
Malformed-Item Behavior
```

Exact field names and serialization behavior must follow existing StoreOps API conventions.

---

## 2.4 Partial-Failure Handling

Each requested item must produce an independently traceable outcome.

Conceptually:

```text
Bulk Request
    │
    ├── Valid Item
    │      ↓
    │   Updated
    │
    ├── Invalid Item
    │      ↓
    │   Failed + Unchanged
    │
    └── Valid Item
           ↓
        Updated
```

The Planner must determine:

```text
Transaction Boundary
Partial-Commit Semantics
Per-Item Error Representation
All-Success Behavior
Mixed-Result Behavior
All-Failed Behavior
Duplicate-Identifier Behavior
Result Ordering
```

A failed item must remain unchanged.

The prompt does not prescribe:

```text
Database Transaction Strategy
Savepoint Strategy
Batch Persistence Strategy
HTTP Status for Partial Success
```

If existing StoreOps transaction conventions conflict with partial-success behavior, the Planner must surface the conflict for human approval.

---

## 2.5 Authorization and Shift Context

Only an actor authorized by existing StoreOps rules may perform the shift-handover update.

The Planner must determine:

- how outgoing-shift staff are identified;
- whether shift membership or ownership exists in StoreOps;
- which existing role or permission authorizes the operation;
- whether an activity must belong to the actor's store, department, shift, or assignment;
- whether authorization is evaluated per request or per activity;
- how unauthorized items are represented; and
- whether existing StoreOps APIs already provide equivalent authorization behavior.

Do not invent:

```text
New Staff Role
New Shift Model
New Identity Model
New Authorization Mechanism
```

If StoreOps has no authoritative outgoing-shift concept, the Planner must surface the ambiguity for human review.

---

## 2.6 Audit Requirement

Every successfully updated activity must produce the audit evidence required by the existing StoreOps audit capability.

Where supported by the existing audit model, the audit evidence should associate:

```text
Activity
Previous Status
New Status
Authorized Actor
Operation Context
Recorded Time
```

The Planner must determine:

- whether an audit model or service already exists;
- which module owns audit behavior;
- the authoritative audit schema;
- how actor identity is represented;
- how timestamps are represented;
- whether audit creation participates in the same transaction;
- what happens if audit creation fails;
- whether failed activity updates produce audit entries;
- how duplicate audit entries are prevented; and
- whether audit behavior requires an approved cross-module interaction.

The prompt does not authorize:

```text
New Audit Platform
Duplicate Audit Model
Direct Cross-Module Repository Access
Unapproved Audit Event
```

A successful response must not claim that an activity was successfully audited when required audit evidence was not created.

---

## 2.7 Concurrency and Idempotency

The Planner must determine existing StoreOps behavior for:

```text
Concurrent Activity Updates
Repeated Bulk Requests
Duplicate Activity Identifiers
Stale Activity State
Optimistic / Pessimistic Concurrency where applicable
Repeated Audit Creation
```

The implementation must reuse existing StoreOps concurrency and idempotency patterns where available.

This prompt does not prescribe a new locking, versioning, or idempotency mechanism.

---

## 2.8 Error Behavior

The feature must preserve the active StoreOps application error contract.

The Planner must determine:

```text
Request-Level Error Behavior
Per-Item Error Behavior
Validation Error Behavior
Authorization Error Behavior
Not-Found Behavior
Conflict Behavior
Audit Failure Behavior
```

The implementation must not introduce a parallel error-response model.

---

## 2.9 Negative Paths

The Planner must define independently evaluable behavior for:

```text
Unknown Activity Identifier
Unsupported Target Status
Prohibited Status Transition
Malformed Item
Duplicate Activity Identifier
Empty Request
Mixed Valid and Invalid Items
All Items Invalid
Unauthorized Request
Unauthorized Activity
Concurrency / Stale-State Conflict
Audit Failure
Repeated Request
```

where applicable to the existing StoreOps implementation.

A failed item must remain unchanged.

An audit entry must not claim a status update that did not succeed.

---

## 3. Expected Business Outcomes

| Scenario | Expected Outcome |
|---|---|
| All requested updates are valid | All approved activities are updated and each successful update has required audit evidence |
| Valid `DONE` transition | Activity is updated according to existing lifecycle rules |
| Valid `BLOCKED` transition | Activity is updated according to existing lifecycle rules |
| Mixed valid and invalid items | Valid and invalid items receive independently traceable outcomes according to approved transaction semantics |
| Unknown activity | That item fails without creating or modifying an activity |
| Unauthorized request/item | Update is rejected according to existing authorization behavior |
| Prohibited transition | Activity remains unchanged and established error behavior applies |
| Audit cannot be created | Behavior follows the approved transaction/audit contract and must not produce a false audited success |
| Repeated/concurrent request | Existing StoreOps concurrency/idempotency behavior is preserved |
| Existing activity APIs | Existing behavior remains backward compatible |

---

## 4. Planner Discovery Requirements

Before producing the implementation specification and sprint contracts, the Planner must inspect the active StoreOps application and resolve implementation-relevant uncertainties from repository evidence.

Inspect, where applicable:

```text
Activities Controller and API Contracts
Activity Status Model
Activity Transition Rules
Activity Services
Activity Repositories
Existing Bulk-Operation Patterns
Request / Response DTOs
Validation
Application Error Contract
Authentication / Authorization
Staff and Shift Relationships
Audit Model
Audit Services
Transaction Conventions
Concurrency Patterns
Idempotency Patterns
Existing Tests
```

The Planner must determine:

1. requested endpoint compatibility;
2. authoritative activity status values;
3. valid `DONE` and `BLOCKED` transitions;
4. outgoing-shift and authorization semantics;
5. request/response contract;
6. batch-size and duplicate-item behavior;
7. transaction and partial-success semantics;
8. per-item error representation;
9. audit ownership and failure behavior;
10. concurrency and repeated-request behavior;
11. backward-compatibility requirements; and
12. whether the feature remains within Activities or requires an approved module interaction.

The Planner must not silently invent material application behavior.

---

## 5. Architecture Discovery

The feature prompt does not define the StoreOps implementation architecture.

The Planner must resolve applicable architecture rules from:

```text
Active Application Configuration
StoreOps Application Context
StoreOps Domain Rules
StoreOps Architecture Rules
Existing Source
Existing Tests
Existing API Patterns
Existing Audit Patterns
```

The implementation must preserve established StoreOps architecture.

Do not introduce:

```text
Controller → Repository
Direct Cross-Module Repository Access
Dependency on Another Module's Internals
Duplicate Audit Infrastructure
Unapproved Cross-Module Side Effect
New Identity / Authorization Platform
Broad Activity-Lifecycle Refactoring
```

If audit behavior crosses a module boundary, the Planner must identify the approved existing interaction mechanism and capture it in the sprint contract.

---

## 6. Sprint Decomposition

Sprint decomposition is determined by the Planner.

The Planner must decompose the feature into independently verifiable sprint contracts based on:

```text
Repository Evidence
Business Dependencies
Architecture Boundaries
Existing StoreOps Patterns
Testability
Risk
```

Each sprint must remain:

- bounded in scope;
- independently testable;
- independently evaluable;
- traceable to this feature intent;
- architecture-aware; and
- suitable for independent Generator/Evaluator execution.

---

## 7. Acceptance Criteria

The Planner must convert this feature intent into explicit acceptance criteria.

Acceptance criteria must:

- have unique identifiers;
- describe observable behavior;
- include positive paths;
- include negative paths;
- identify applicable architecture constraints;
- identify required tests;
- avoid unnecessary implementation details; and
- be independently evaluable.

Acceptance criteria must cover, where applicable:

```text
All-Success Bulk Update
DONE Transition
BLOCKED Transition
Mixed Success / Failure
Unknown Activity
Invalid Status
Invalid Transition
Unauthorized Request / Item
Failed Item Remains Unchanged
Audit per Successful Update
No False Audit for Failed Update
Audit Failure Behavior
Duplicate Identifier
Empty Request
Concurrency / Idempotency
Application Error Contract
Backward Compatibility
```

Use:

```text
GIVEN
WHEN
THEN
```

where appropriate.

---

## 8. Testing Intent

The implementation must include automated tests sufficient to demonstrate the approved business behavior.

Tests should cover, where applicable:

```text
All Items Successful
Mixed Successful and Failed Items
All Items Failed
DONE Transition
BLOCKED Transition
Unknown Activity
Invalid Status
Prohibited Transition
Duplicate Identifier
Empty Request
Unauthorized Request / Item
Audit per Successful Update
No Audit for Failed Update
Audit Failure Behavior
Concurrency / Stale State
Repeated Request / Idempotency
Application Error Behavior
Existing API Regression
```

Exact test frameworks, coverage thresholds, commands, static-analysis checks, architecture checks, security checks, and hard gates are resolved from active technology and governance configuration.

This prompt does not define those values.

---

## 9. Existing Application Compatibility

The implementation must integrate with the existing StoreOps application rather than create a parallel application model.

Prefer existing:

```text
Activity Models
Status Semantics
Transition Rules
Controllers
Services
Repositories
DTOs
Validation
Error Handling
Authorization
Staff / Shift Relationships
Audit Mechanisms
Transaction Patterns
Concurrency Patterns
Testing Conventions
Module Boundaries
```

Avoid unnecessary:

- framework changes;
- package restructuring;
- new dependencies;
- duplicate activity models;
- duplicate status models;
- duplicate audit mechanisms;
- new authorization mechanisms; and
- unrelated refactoring.

---

## 10. Scope Control

The feature scope is limited to Shift Handover Bulk Update.

Do not expand the feature into:

```text
New Activity Statuses
New Shift-Management Platform
New Identity Platform
New Authorization Platform
New Audit Platform
Generic Bulk-Processing Framework
Generic Workflow Engine
Changes to Unrelated StoreOps Modules
StoreOps-Wide API Refactoring
Deployment Infrastructure Changes
```

unless repository evidence demonstrates that an existing approved mechanism must be extended.

Material scope changes require explicit review through the governed harness workflow.

---

## 11. Harness Integration

This prompt defines:

```text
WHAT business outcome is required
```

The governed harness determines:

```text
HOW configuration is resolved
HOW the feature is planned
HOW architecture rules are applied
HOW implementation is generated
HOW implementation is evaluated
HOW retries are controlled
HOW evidence is preserved
HOW escalation is governed
```

The following remain authoritative:

```text
CLAUDE.md
Active Harness Configuration
Application Configuration
Technology Configuration
Governance Policy
Domain Skills
Technology Skills
Existing StoreOps Evidence
Approved Sprint Contract
```

If this prompt conflicts with a mandatory governance or architecture rule:

```text
Mandatory Governance / Architecture Rule Wins
```

The conflict must be surfaced rather than silently ignored.

---

## 12. Required Planner Outputs

The Planner must convert this prompt into:

```text
spec.md
sprint-N-contract.md
```

The specification should capture:

```text
Business Objective
Scope
Out of Scope
Impacted Components
Repository Findings
API Findings
Status / Transition Findings
Authorization Findings
Transaction / Partial-Failure Findings
Audit Findings
Concurrency / Idempotency Findings
Assumptions
Open Questions
Architecture Constraints
Sprint Decomposition
Dependencies
Risks
```

Each sprint contract must use the mandatory structure defined by the active sprint-contract template.

The Planner must not begin implementation.

---

## 13. Human Approval

After producing the specification and sprint contracts, Planner must stop with:

```text
STATUS: AWAITING_APPROVAL
```

Implementation begins only after the configured human approval command is received.

Human review should explicitly confirm:

```text
Endpoint Contract
Status Semantics
Authorization
Partial-Failure Semantics
Transaction Boundary
Audit Behavior
Concurrency / Idempotency
Application Error Behavior
Module Interaction
Acceptance Criteria
Tests
Backward Compatibility
Sprint Scope
```

Material changes to the approved contract require re-approval.

If implementation later requires a material contract change, the governed workflow must return for review rather than silently expanding scope.

---

## 14. Completion Intent

The feature is complete when the approved implementation demonstrates:

```text
Authorized Shift-Handover Request
        ↓
Validate Bulk Request
        ↓
Evaluate Each Activity
        ↓
Validate Approved Status Transition
        ↓
Process under Approved Transaction Semantics
        │
        ├── Success
        │      ↓
        │   Update Activity
        │      ↓
        │   Create Required Audit Evidence
        │
        └── Failure
               ↓
            Keep Activity Unchanged
               ↓
            Record Item Failure
        ↓
Return Traceable Bulk Result
```

The implementation mechanism, transaction handling, audit integration, architecture, testing, evaluation, deployment, rollback, and governance mechanisms must be determined by the active configuration, existing StoreOps design, and approved sprint contracts.

**This prompt does not prescribe the implementation mechanism.**

The final implementation must preserve existing StoreOps contracts, module ownership, status semantics, authorization, error handling, audit conventions, backward compatibility, and governed harness controls.
