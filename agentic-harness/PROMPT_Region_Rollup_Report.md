# PROMPT.md

# StoreOps Regional Rollup Report

**Artifact Type:** Demonstration Feature Prompt  
**Reference Application:** StoreOps  
**Feature:** Regional Rollup Report  
**Requested API Contract:** `GET /api/reports/region/:id`  
**Version:** 2.0  
**Status:** Ready for Planner Invocation

---

## 1. Purpose

Implement **Regional Rollup Reporting** for the StoreOps reference application using the governed agentic delivery harness.

The requested API is:

```text
GET /api/reports/region/:id
```

The requested report aggregates operational activity information across all stores associated with a region, including:

```text
Task Completion Rates
Overdue Counts by TaskCategory
Blocked-Task Lists
```

The original feature request also asks for:

```text
REGIONAL_ROLLUP Report Record
        +
Event-Bus Trigger
```

The Planner must validate whether `REGIONAL_ROLLUP`, Report-record persistence, event publication, and any state-changing behavior associated with a `GET` request are established and compatible with StoreOps architecture.

This prompt defines the **business intent and expected outcomes**.

It does not silently mandate an event bus, persistence mechanism, cross-module interaction, state-changing `GET`, technology implementation, governance threshold, or StoreOps architecture.

---

## 2. Business Requirement

An authorized StoreOps user must be able to retrieve a consolidated operational report for a region.

The report must include data for every store authoritatively associated with the requested region and visible to the caller.

The output must allow the caller to understand:

- activity/task completion performance across the region;
- overdue workload grouped by the authoritative category concept;
- currently blocked activities/tasks; and
- the store or other approved context associated with the aggregated results.

The Planner must verify whether StoreOps uses:

```text
Activity
Task
Operational Activity
```

or another authoritative domain term and use existing StoreOps vocabulary.

---

## 2.1 Requested API Contract

The requested API is:

```text
GET /api/reports/region/:id
```

The Planner must validate:

```text
Existing Reports Base Path
Region Identifier Format
Path-Variable Convention
Response DTO Convention
Authorization Convention
Error-Response Convention
API Versioning
Backward Compatibility
```

If `:id` conflicts with established Java/Spring or StoreOps path syntax, the Planner must preserve the business intent while defining the compatible concrete contract in the sprint contract.

If an equivalent regional report endpoint already exists, the Planner must not create a duplicate API.

---

## 2.2 Region and Store Scope

The report must include all stores associated with the requested region according to existing StoreOps relationships.

The Planner must determine:

- whether Region exists as an authoritative StoreOps entity or value;
- how stores are associated with a region;
- how the region identifier is represented;
- whether inactive or closed stores are included;
- whether inaccessible stores are excluded;
- whether the caller may view every store in the region;
- how a missing or invalid region is represented;
- how a region with no stores is represented; and
- whether access is restricted by role, tenant, store, or organizational boundary.

Do not invent:

```text
New Region Model
New Store Hierarchy
New Authorization Rule
```

If StoreOps lacks an authoritative regional relationship, the Planner must surface the gap for human review.

---

## 2.3 Completion Rate

The report must provide task/activity completion rates using existing StoreOps completion semantics.

The Planner must determine:

```text
Completed-State Definition
Eligible Population / Denominator
Excluded States
Aggregation Period, if any
Store-Level Calculation
Region-Level Calculation
Rounding / Precision
No-Data Behavior
```

The prompt does not assume that:

```text
DONE
```

is the only completed state unless repository evidence confirms it.

The Planner must determine how cancelled, excluded, archived, or otherwise non-operational activities affect the denominator where such states exist.

The calculation must be deterministic and traceable to repository evidence and the approved sprint contract.

A zero denominator must not result in a fabricated completion percentage.

---

## 2.4 Overdue Counts by TaskCategory

The report must aggregate overdue activity/task counts by the authoritative StoreOps category concept.

The Planner must determine:

- whether `TaskCategory` exists and its actual representation;
- authoritative category values;
- which activities are eligible for overdue evaluation;
- the authoritative overdue rule;
- treatment of resolved/completed activities;
- treatment of cancelled or excluded activities;
- due-date and time-zone conventions;
- treatment of missing categories;
- grouping conventions;
- deterministic ordering; and
- whether counts are regional totals, store-level breakdowns, or both.

Do not invent:

```text
TaskCategory Values
Overdue Semantics
Category Hierarchy
```

when existing StoreOps evidence already defines them.

---

## 2.5 Blocked-Task List

The report must include activities/tasks that StoreOps considers blocked.

The Planner must determine:

```text
Authoritative Blocked-State Representation
Blocked-Item Summary Fields
Store Context
Department Context where applicable
Ordering
Deterministic Tie-Breaking
Authorization / Sensitive-Field Restrictions
Pagination / Result-Size Limits
Historical versus Current Blocked Items
Empty-List Behavior
```

The report must not expose persistence models, internal implementation details, or sensitive information merely because those values are available internally.

---

## 2.6 Time and Snapshot Semantics

The Planner must determine how StoreOps establishes the effective time of the report.

Inspect existing conventions for:

```text
Current Time
Due Date / Time
Time Zone
Clock Abstraction
Report Evaluation Time
Time-Based Testing
```

Completion, overdue, and blocked calculations within one report should use consistent evaluation semantics.

The prompt does not prescribe a new clock abstraction.

---

## 2.7 Authorization and Data Visibility

The Planner must determine:

- who may request a regional report;
- whether access is region-scoped;
- whether individual stores may be excluded from the caller's visibility;
- whether blocked-task details contain restricted information;
- whether aggregation may include data the caller cannot inspect individually; and
- how authorization failures are represented.

Do not invent a new role or authorization mechanism.

The report must not bypass existing StoreOps data-visibility rules.

---

## 2.8 Requested `REGIONAL_ROLLUP` Record and Event Behavior

The original feature request includes:

```text
Generate a REGIONAL_ROLLUP Report Record
        +
Trigger through the Event Bus
```

This behavior must be validated by Planner discovery.

The Planner must inspect:

```text
StoreOps Reports Model
Reports Architecture Rules
Reports Read-Only Constraint
Existing Report Types
Existing Business Events
Existing Event Mechanism
Existing Event Publishers
Existing Event Consumers
Existing Report Persistence
Existing Tests
```

The Planner must determine:

1. whether `REGIONAL_ROLLUP` is an existing StoreOps report type;
2. whether a persistent Report record already exists as an approved concept;
3. whether Reports may create persistent records without violating its read-only constraint;
4. whether an existing event represents report generation or report access;
5. whether a `GET` request is permitted to cause a state-changing side effect;
6. which module owns any persistent record;
7. which module owns event publication;
8. which module consumes the event;
9. required event payload;
10. duplicate/idempotency behavior; and
11. whether the report should instead remain purely read-only.

If the requested behavior conflicts with:

```text
Reports Read-Only
Safe HTTP GET Semantics
Existing StoreOps Event Contracts
Module Ownership
Approved Cross-Module Interaction Rules
```

the Planner must:

1. document the conflict;
2. identify the authoritative StoreOps constraint;
3. identify viable contract options;
4. describe the business impact; and
5. surface the decision for human approval.

The Planner must not silently:

```text
Create REGIONAL_ROLLUP Event
Create New Report Persistence
Make GET Mutate State
Introduce New Event Bus
Bypass Module Boundaries
Ignore the Requested Business Outcome
```

Any approved Report-record or event behavior must be explicit in the approved sprint contract.

---

## 2.9 Performance and Result-Size Behavior

Regional aggregation may span multiple stores and potentially large activity sets.

The Planner must inspect existing StoreOps reporting and query patterns and determine:

```text
Expected Region Size
Expected Store Count
Expected Activity Volume
Existing Pagination Convention
Existing Aggregation Strategy
Existing Query Interfaces
Result-Size Limits
Timeout / Performance Expectations where defined
```

The implementation must not introduce an unnecessary new analytics platform, cache, database, or reporting infrastructure.

Performance requirements must come from existing application evidence or the approved sprint contract.

---

## 2.10 Error and Empty-Result Behavior

The feature must preserve the active StoreOps application error contract.

The Planner must determine behavior for:

```text
Unknown Region
Invalid Region Identifier
Unauthorized Region
Region with No Stores
Region with No Activities
No Overdue Activities
No Blocked Activities
Unavailable Required Data
Approved Event / Record Failure where applicable
```

Empty business results must not automatically be treated as errors unless existing StoreOps behavior requires it.

The implementation must not introduce a parallel error-response model.

---

## 3. Expected Business Outcomes

| Scenario | Expected Outcome |
|---|---|
| Valid region with multiple stores | One consolidated report covers all authorized stores associated with the region |
| Completed and incomplete activities | Completion rate follows the approved calculation |
| Zero eligible activities | Approved no-data behavior is returned without fabricated percentages |
| Overdue activities in multiple categories | Counts are grouped by the authoritative category |
| Blocked activities across stores | Blocked list contains the approved summary and store context |
| Region with no stores | Established empty/no-data behavior is returned |
| Region with no activity data | No metrics are fabricated |
| Unknown region | Existing StoreOps not-found/error behavior is preserved |
| Unauthorized regional access | Existing authorization behavior is applied |
| Large regional result | Approved aggregation, size, or pagination behavior is applied |
| Approved `REGIONAL_ROLLUP` record/event | Exactly the approved record/event behavior occurs |
| Record/event behavior not approved | The report remains free of unapproved state-changing side effects |
| Existing Reports APIs | Existing behavior remains backward compatible |

---

## 4. Planner Discovery Requirements

Before producing the implementation specification and sprint contracts, the Planner must inspect the active StoreOps application and resolve implementation-relevant uncertainties from repository evidence.

Inspect, where applicable:

```text
Reports Controllers
Reports Services
Reports Read-Only Constraints
Activities / Tasks
Activity Status Semantics
TaskCategory or Equivalent Model
Stores
Regional Relationships
Due-Date Handling
Time-Zone Handling
Blocked-State Semantics
Authorization
Data Visibility
Existing Aggregation Patterns
Existing Reporting Patterns
Existing Report Models
Existing Report Persistence
Existing Business Events
Existing Event Mechanism
Existing DTOs
Application Error Contract
Existing Tests
```

The Planner must resolve:

1. requested endpoint compatibility;
2. authoritative Region-to-Store relationships;
3. completion-state semantics;
4. completion-rate denominator and calculation;
5. overdue semantics;
6. category representation;
7. blocked-list fields and ordering;
8. time/snapshot semantics;
9. empty/no-data behavior;
10. invalid-region behavior;
11. authorization and data visibility;
12. aggregation size and performance constraints;
13. Reports read-only constraints;
14. whether `REGIONAL_ROLLUP` exists;
15. whether Report-record persistence is established;
16. whether event behavior is established;
17. whether a `GET` side effect is architecturally permitted;
18. approved cross-module read and side-effect mechanisms; and
19. backward-compatibility requirements.

Material ambiguity must be surfaced for human decision.

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
StoreOps Business Events
Existing Source
Existing Tests
Existing Reporting Patterns
```

The implementation must preserve StoreOps architecture.

Where Reports is established as read-only:

```text
Reports
    ↓
Read / Aggregate
```

must not silently become:

```text
Reports
    ↓
Operational Mutation
```

Cross-module reads must use the approved StoreOps application-facing mechanism.

Direct access from Reports to another module's repository is prohibited where established by the active architecture rules.

Any approved side effect must:

- have a clear owning module;
- use the established StoreOps interaction mechanism;
- preserve safe API semantics or use an explicitly approved alternative flow;
- avoid duplicate events or records;
- remain traceable to the approved contract; and
- not turn Reports into an operational write owner.

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

The Planner should consider separating:

```text
Read-Only Regional Aggregation
```

from:

```text
Optional REGIONAL_ROLLUP Record / Event Behavior
```

when doing so improves:

- independent approval;
- architecture safety;
- testability;
- traceability; or
- rollback.

This is guidance only.

The Planner remains responsible for the actual sprint decomposition.

Each sprint must remain:

- bounded in scope;
- independently testable;
- independently evaluable;
- traceable to this feature intent; and
- architecture-aware.

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
Valid Region
Single-Store Region
Multi-Store Aggregation
Completion-Rate Calculation
Zero-Denominator Behavior
Overdue Counts by Category
Blocked-Task List
Deterministic Ordering
Region with No Stores
Region with No Activity Data
Unknown / Invalid Region
Unauthorized Access
Data Visibility
Large Result / Pagination / Limits
Time-Zone Boundaries
Application Error Contract
Backward Compatibility
Reports Read-Only Compliance
Approved REGIONAL_ROLLUP Record
Approved Event Publication
Duplicate / Idempotency Behavior
No Unapproved Side Effect from GET
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
Single-Store Region
Multi-Store Region
Region-Level Completion Rate
Store-Level Aggregation where approved
Completed / Incomplete / Excluded States
Zero / No-Data Denominator
Overdue Counts by Authoritative Category
Resolved / Non-Overdue Exclusions
Blocked Tasks Across Multiple Stores
Deterministic Blocked-Item Ordering
No Blocked Tasks
Region with No Stores
Region with No Activity Data
Unknown / Invalid Region
Unauthorized Access
Data-Visibility Restrictions
Large Regional Dataset
Pagination / Result Limits where applicable
Time-Zone and Due-Date Boundaries
Application Error Behavior
Backward-Compatible Existing Reports
Approved REGIONAL_ROLLUP Record
Approved Event Publication
Duplicate / Idempotency Behavior
No Unapproved Side Effect from GET
```

Exact test frameworks, coverage thresholds, commands, static-analysis checks, architecture checks, security checks, and hard gates are resolved from active technology and governance configuration.

This prompt does not define those values.

---

## 9. Existing Application Compatibility

The implementation must integrate with the existing StoreOps application rather than create a parallel reporting or regional model.

Prefer existing:

```text
Region Models
Store Models
Activity / Task Models
Status Semantics
TaskCategory Semantics
Reporting Services
Reporting DTOs
Read-Only Query Interfaces
Authorization Rules
Time Handling
Error Contracts
Business Events
Testing Conventions
Module Boundaries
```

Avoid unnecessary:

- duplicate Region models;
- duplicate Store models;
- duplicate category definitions;
- direct cross-module repository access;
- duplicate reporting infrastructure;
- new event infrastructure;
- state mutation hidden inside a read request;
- package restructuring;
- new dependencies; and
- unrelated StoreOps refactoring.

---

## 10. Scope Control

The feature scope is limited to Regional Rollup Reporting.

Do not expand the feature into:

```text
Regional Hierarchy Redesign
New Analytics Platform
Data Warehouse
New Event Bus
Generic Reporting Engine
Operational Writes Owned by Reports
New Task Categories
Activity Lifecycle Changes
Store Administration
Region Administration
Scheduled Report Distribution
StoreOps-Wide Refactoring
Deployment Infrastructure Changes
```

unless repository evidence demonstrates that an existing approved mechanism must be extended.

Material scope or architecture changes require explicit review through the governed harness workflow.

---

## 11. Harness Integration

This prompt defines:

```text
WHAT regional reporting outcome is required
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
Region / Store Findings
Completion-Rate Definition
Overdue Definition
TaskCategory Findings
Blocked-State Findings
Time / Snapshot Findings
Authorization / Visibility Findings
Performance Findings
Reports Architecture Constraints
REGIONAL_ROLLUP Findings
Event / Persistence Findings
Application Error Findings
Assumptions
Open Questions
Sprint Decomposition
Dependencies
Risks
```

Each sprint contract should capture the mandatory structure defined by the active sprint-contract template.

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
Region / Store Scope
Completion-Rate Formula
Zero-Denominator Behavior
Overdue Semantics
TaskCategory Semantics
Blocked-List Contract
Time / Snapshot Semantics
Authorization / Data Visibility
Empty / Error Behavior
Aggregation / Performance Approach
Reports Read-Only Compliance
REGIONAL_ROLLUP Record Behavior
Event Behavior
Sprint Decomposition
Acceptance Criteria
Tests
Backward Compatibility
```

Any `REGIONAL_ROLLUP` record or event behavior must be explicitly approved if Planner determines that it is compatible with StoreOps architecture.

Material changes require re-approval.

If implementation later requires a material contract change, the governed workflow must return for review rather than silently expanding scope.

---

## 14. Completion Intent

The feature is complete when the approved implementation demonstrates:

```text
Authorized Regional Report Request
        ↓
Resolve Region
        ↓
Resolve Authorized Stores
        ↓
Read Approved Activity / Task Information
        ↓
Apply Consistent Report Evaluation Semantics
        ↓
Aggregate
        │
        ├── Completion Rates
        │
        ├── Overdue Counts by Category
        │
        └── Blocked-Task List
        ↓
Return Deterministic Regional Rollup
        ↓
Perform Only Explicitly Approved
REGIONAL_ROLLUP Record / Event Behavior
```

The implementation mechanism, aggregation strategy, cross-module interaction, event behavior, persistence behavior, architecture, testing, evaluation, deployment, rollback, and governance mechanisms must be determined by the active configuration, existing StoreOps design, and approved sprint contracts.

**This prompt does not prescribe the implementation mechanism.**

The final implementation must preserve Reports read-only responsibilities where established, safe API semantics, module ownership, application error behavior, authorization and data visibility, backward compatibility, existing StoreOps contracts, and governed approval of any `REGIONAL_ROLLUP` record or event behavior.
