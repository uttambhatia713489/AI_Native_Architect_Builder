# PROMPT.md

# StoreOps Planogram Task Template

**Artifact Type:** Demonstration Feature Prompt  
**Reference Application:** StoreOps  
**Feature:** Planogram Task Template  
**Requested API Contract:** `POST /api/programmes/:id/templates`  
**Version:** 2.0  
**Status:** Ready for Planner Invocation

---

## 1. Purpose

Implement **Planogram Task Template** support for the StoreOps reference application using the governed agentic delivery harness.

The requested capability allows an authorized StoreOps user to apply a standard Planogram task template to an existing eligible store programme.

The requested API contract is:

```text
POST /api/programmes/:id/templates
```

The requested business behavior is:

```text
Select Target Programme
        +
Resolve Approved PLANOGRAM Template
        ↓
Clone Template Task Definitions
        ↓
Create Programme Activities / Tasks
        ↓
Apply Department Assignments
        +
Apply Default Priorities
```

This prompt defines the **business intent and expected outcomes** of the feature.

It does not define reusable harness orchestration, technology-specific implementation rules, governance thresholds, evaluation policy, persistence implementation, transaction strategy, authorization implementation, template-storage mechanism, deployment controls, or StoreOps architecture.

Those concerns are resolved through:

```text
CLAUDE.md
Active Harness Configuration
StoreOps Skills
Java/Spring Skills
Existing StoreOps Application
Approved Sprint Contracts
```

The Planner must inspect the active StoreOps configuration, domain rules, architecture rules, existing source, tests, Programme behavior, Activity/Task behavior, department relationships, priority semantics, template concepts, and existing application conventions before determining the implementation approach.

---

## 2. Business Requirement

StoreOps must support applying a standard set of Planogram activities/tasks to an eligible store programme.

An authorized user must be able to request that a Planogram template be applied to an existing programme.

The template represents the standard operational work to be created for that programme.

The resulting activities/tasks must preserve the approved template intent, including:

```text
PLANOGRAM Task / Activity Definition
Department Assignment
Default Priority
Other Existing Template-Owned Defaults where applicable
```

The implementation must integrate with existing StoreOps Programme and Activity/Task models rather than create parallel programme, task, department, priority, or template models.

---

## 2.1 Requested API Contract

The requested API is:

```text
POST /api/programmes/:id/templates
```

The Planner must validate this method and path against the existing StoreOps Programmes API.

The Planner must determine:

```text
Existing Programmes Base Path
Programme Identifier Convention
Existing POST Conventions
Existing Template-Related APIs
Request DTO Convention
Response DTO Convention
Validation Convention
Application Error Contract
API Versioning Convention
Backward-Compatibility Requirements
```

If `:id` conflicts with established Java/Spring or StoreOps path syntax, the Planner must preserve the business intent while defining the compatible concrete API contract in the sprint contract.

If an equivalent template-application capability already exists, the Planner must not create a duplicate API.

If the requested contract conflicts with an established StoreOps API convention, the Planner must:

1. document the conflict;
2. identify the existing compatible convention;
3. describe the backward-compatibility impact;
4. propose the smallest compatible contract; and
5. surface the decision for human approval.

The Planner must not silently rename, replace, or duplicate an existing API.

---

## 2.2 Programme Eligibility

The template must be applied only to an eligible StoreOps programme.

The Planner must determine:

- the authoritative Programme model;
- programme lifecycle/status semantics;
- whether templates may be applied to every programme state;
- whether the programme must belong to a specific store;
- whether programme type affects eligibility;
- whether completed, cancelled, archived, or otherwise inactive programmes are eligible;
- whether existing programme configuration affects template application; and
- how an unknown or ineligible programme is represented.

Do not invent:

```text
New Programme Status
New Programme Type
New Programme Lifecycle
```

when existing StoreOps evidence already defines these concepts.

---

## 2.3 Planogram Template Definition

The requested feature assumes the existence of a standard Planogram template definition.

The Planner must determine whether StoreOps already provides an authoritative concept for:

```text
Template
Task Template
Activity Template
Programme Template
PLANOGRAM Template
Standard Task Definition
```

The Planner must inspect existing:

```text
Domain Models
Configuration
Programme Models
Activity / Task Models
TaskCategory
Business Rules
Existing Tests
```

The Planner must determine:

- where template definitions originate;
- whether templates are persisted, configured, or otherwise resolved;
- how a Planogram template is identified;
- whether multiple Planogram templates may exist;
- whether templates are versioned;
- whether templates are store-specific, region-specific, department-specific, or global;
- whether templates may be inactive;
- whether template definitions may change after application; and
- whether an applied programme must retain the template identifier or version for traceability.

The prompt does not prescribe a template-storage mechanism.

Do not introduce a new generic template platform unless repository evidence and an approved sprint contract require it.

If no authoritative template concept exists, the Planner must surface the gap and proposed minimum domain change for human approval rather than silently inventing one.

---

## 2.4 PLANOGRAM Semantics

The Planner must determine whether:

```text
PLANOGRAM
```

is an authoritative StoreOps:

```text
TaskCategory
Activity Type
Programme Type
Template Type
Business Classification
```

or another existing domain concept.

The implementation must use the authoritative StoreOps representation.

The Planner must not silently introduce a new `PLANOGRAM` enum, category, type, or domain concept if an equivalent existing representation already exists.

If `PLANOGRAM` does not exist in the current StoreOps domain model, the Planner must surface the gap for human review.

---

## 2.5 Task / Activity Creation

Applying the template must create the approved set of operational activities/tasks for the target programme.

Conceptually:

```text
Planogram Template
        ↓
Template Task Definition 1
Template Task Definition 2
Template Task Definition 3
        ↓
Apply to Programme
        ↓
Programme Activity / Task 1
Programme Activity / Task 2
Programme Activity / Task 3
```

The Planner must determine:

```text
Authoritative Activity / Task Model
Required Fields
Programme Relationship
Store Relationship
Department Relationship
Initial Status
Priority
Due-Date Behavior
Assignment Behavior
Identifier Generation
Creation Validation
```

The prompt does not prescribe the number of tasks contained in a template.

The implementation must create only the tasks defined by the approved template.

The Planner must determine whether template application represents:

```text
Cloning Template Definitions
```

or:

```text
Creating New Activities / Tasks from Template Definitions
```

according to the existing StoreOps domain model.

Template definitions must not accidentally become mutable operational tasks.

---

## 2.6 Initial Activity / Task State

The Planner must determine the authoritative initial state for activities/tasks created from a Planogram template.

Inspect existing StoreOps behavior for:

```text
Initial Activity Status
Creation Timestamp
Due-Date Initialization
Assignment State
Completion State
Resolution State
```

The prompt does not prescribe an initial status.

Do not assume:

```text
OPEN
NEW
PENDING
```

or another state unless repository evidence establishes it.

---

## 2.7 Department Assignment

Template-created activities/tasks must receive department assignments according to the template definition and existing StoreOps department semantics.

The Planner must determine:

- how departments are represented;
- how a programme relates to departments;
- how a store relates to departments;
- whether template definitions reference department identifiers, department types, department codes, or another abstraction;
- how a template department is resolved for the target programme/store;
- what happens when a required department cannot be resolved;
- whether department assignment is mandatory for every Planogram task;
- whether department assignments may be overridden; and
- whether authorization or store boundaries affect department resolution.

Do not invent:

```text
New Department Model
New Department Mapping Platform
New Cross-Store Department Relationship
```

The implementation must use existing StoreOps department relationships where available.

---

## 2.8 Default Priority

Template-created activities/tasks must receive the default priority defined by the template where applicable.

The Planner must determine:

```text
Authoritative Priority Model
Valid Priority Values
Template Priority Representation
Default-Priority Behavior
Missing-Priority Behavior
Priority Validation
```

The implementation must not invent new priority values.

If the template does not define a priority, the Planner must determine whether StoreOps already provides an approved default.

A hard-coded fallback priority must not be introduced unless existing StoreOps behavior explicitly establishes it.

---

## 2.9 Template Overrides and Precedence

The Planner must determine whether the existing StoreOps model permits template defaults to be overridden.

Where applicable, determine precedence between:

```text
Template Definition
Programme Configuration
Store Configuration
Department Configuration
Existing Domain Defaults
Request-Supplied Values
```

The prompt does not authorize arbitrary caller overrides.

If overrides are supported, the approved sprint contract must explicitly define:

```text
Which Fields May Be Overridden
Who May Override Them
Validation Rules
Precedence Rules
```

If overrides are not established by repository evidence, the implementation must preserve template-defined values rather than inventing override behavior.

---

## 2.10 Duplicate Application and Idempotency

The Planner must determine what happens when the same Planogram template is applied repeatedly to the same programme.

Consider:

```text
Repeated API Request
Same Template Applied Twice
Client Retry
Application Retry
Concurrent Template Application
Application Restart
Partial Previous Application
```

The Planner must determine whether StoreOps should:

```text
Reject Duplicate Application
Return Existing Result
Create Another Approved Set
Use Existing Idempotency Behavior
```

based on repository evidence and approved business rules.

The implementation must not silently create duplicate operational tasks when existing StoreOps semantics prohibit them.

This prompt does not prescribe a new idempotency mechanism.

---

## 2.11 Transaction and Partial-Failure Behavior

Applying a template may create multiple activities/tasks.

The Planner must determine the authoritative transaction behavior.

Conceptually, repository-supported behavior may require:

```text
Validate Programme
        +
Validate Template
        +
Resolve Required Departments / Defaults
        ↓
Create Approved Template Tasks
        ↓
Template Application Successful
```

The Planner must determine:

- whether template application is atomic;
- whether partial task creation is permitted;
- what happens when one template task definition is invalid;
- what happens when one department cannot be resolved;
- what happens when one priority is invalid;
- what happens when persistence fails partway through creation;
- whether successfully created tasks must be rolled back;
- how retry behaves after partial failure; and
- how the API represents the outcome.

The prompt does not prescribe:

```text
Database Transaction Strategy
Rollback Implementation
Savepoint Strategy
Partial-Commit Strategy
```

If repository evidence does not establish the required behavior, the Planner must surface the decision for human approval.

---

## 2.12 Authorization

Only an actor authorized by existing StoreOps rules may apply a Planogram template to a programme.

The Planner must determine:

- which existing role or permission authorizes template application;
- whether authorization is programme-scoped;
- whether authorization is store-scoped;
- whether department ownership affects authorization;
- whether template visibility is restricted;
- whether programme lifecycle affects authorization; and
- how authorization failures are represented.

Do not invent:

```text
New Role
New Permission Model
New Identity Mechanism
```

The implementation must preserve existing StoreOps authorization behavior.

---

## 2.13 Audit and Traceability

The Planner must determine whether StoreOps requires audit evidence for:

```text
Template Applied
Programme Modified
Activities / Tasks Created
Department Assignments Applied
Priority Defaults Applied
```

If an existing audit mechanism applies, the implementation must integrate with it.

The Planner must determine:

- audit ownership;
- required audit fields;
- actor representation;
- template identifier/version representation;
- programme identifier;
- created activity/task references;
- timestamp behavior;
- transaction relationship; and
- audit-failure behavior.

The prompt does not authorize a new audit platform.

If StoreOps does not require audit evidence for this operation, the Planner must not introduce a new audit mechanism solely for this feature.

---

## 2.14 Business Events and Side Effects

The Planner must inspect the active StoreOps business-event knowledge and existing source to determine whether template application or created activities/tasks produce existing business events or other side effects.

The Planner must determine:

```text
Existing Relevant Business Events
Existing Event Publishers
Existing Event Consumers
Required Event Payload
Event Ownership
Duplicate / Idempotency Behavior
```

The prompt does not mandate a new event.

Do not invent:

```text
PLANOGRAM_TEMPLATE_APPLIED
PLANOGRAM_TASK_CREATED
```

or another event unless repository evidence and the approved sprint contract establish the requirement.

Any cross-module side effect must use the approved StoreOps interaction mechanism.

---

## 2.15 Error Behavior

The feature must preserve the active StoreOps application error contract.

The Planner must determine behavior for:

```text
Unknown Programme
Ineligible Programme
Unknown Template
Inactive Template
Invalid Template Definition
Empty Template
Missing Department
Invalid Department Mapping
Invalid Priority
Unauthorized Request
Duplicate Template Application
Concurrent Application
Task-Creation Failure
Audit Failure where applicable
```

The implementation must not introduce a parallel error-response model.

Exact error codes, response structures, and HTTP mappings must follow existing StoreOps conventions and the approved sprint contract.

---

## 2.16 Negative Paths

The Planner must define independently evaluable behavior for, where applicable:

```text
Unknown Programme
Ineligible Programme
Unknown Planogram Template
Inactive Template
Empty Template
Invalid Template Task
Missing Department Assignment
Invalid Department Assignment
Invalid Default Priority
Unauthorized Request
Duplicate Template Application
Concurrent Template Application
Partial Creation Failure
Audit Failure
```

Failed template application must not leave the programme in an inconsistent state according to the approved transaction semantics.

---

## 3. Expected Business Outcomes

The completed feature must demonstrate the following observable outcomes.

| Scenario | Expected Outcome |
|---|---|
| Valid Planogram template applied to eligible programme | Approved template tasks/activities are created for the programme |
| Template contains multiple task definitions | Each approved definition produces the corresponding programme task/activity |
| Template defines department assignments | Created tasks receive the approved department assignments |
| Template defines default priorities | Created tasks receive the approved priorities |
| Template/default precedence applies | Values follow the approved StoreOps precedence rules |
| Programme is unknown | Existing StoreOps not-found/error behavior is preserved |
| Programme is ineligible | No unapproved tasks are created |
| Template is unknown or inactive | No tasks are created and established error behavior applies |
| Required department cannot be resolved | Behavior follows the approved transaction/error contract |
| Template contains invalid priority | Invalid template/task behavior follows established validation rules |
| Same template is applied repeatedly | Approved duplicate/idempotency behavior is preserved |
| Concurrent application occurs | Existing StoreOps concurrency behavior is preserved |
| Template application fails partway | Programme remains consistent according to approved transaction semantics |
| Existing audit behavior applies | Required audit evidence is created without introducing a parallel audit mechanism |
| Existing business events apply | Only established and approved event behavior occurs |
| Existing Programme and Activity APIs | Existing behavior remains backward compatible |

The implementation must preserve these business outcomes regardless of the approved technical mechanism used to implement them.

---

## 4. Planner Discovery Requirements

Before producing the implementation specification and sprint contracts, the Planner must inspect the active StoreOps application and resolve implementation-relevant uncertainties from repository evidence.

Inspect, where applicable:

```text
Programmes Controllers
Programmes Services
Programmes Repositories
Programme Domain Model
Programme Lifecycle
Activities / Tasks
Activity / Task Creation Services
TaskCategory
Priority Model
Department Model
Store / Department Relationships
Existing Template Concepts
Existing Configuration
Authorization
Application Error Contract
Audit Mechanism
Business Events
Transaction Conventions
Concurrency / Idempotency Patterns
Existing Tests
```

The Planner must resolve:

1. requested endpoint compatibility;
2. authoritative Programme semantics;
3. programme eligibility;
4. authoritative `PLANOGRAM` semantics;
5. existing template concepts;
6. template source and identification;
7. template versioning where applicable;
8. task/activity creation behavior;
9. initial task/activity state;
10. department-resolution behavior;
11. priority/default behavior;
12. override/precedence behavior;
13. duplicate/idempotency behavior;
14. transaction and partial-failure semantics;
15. authorization;
16. audit requirements;
17. applicable business events or side effects;
18. application error behavior;
19. module interactions;
20. backward-compatibility requirements; and
21. required automated tests.

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
Existing Programme Patterns
Existing Activity / Task Patterns
```

The implementation must preserve established StoreOps architecture.

Do not introduce:

```text
Controller → Repository

Direct Cross-Module Repository Access

Dependency on Another Module's Internals

Duplicate Programme Model

Duplicate Activity / Task Model

Duplicate Department Model

Duplicate Priority Model

Generic Template Platform

Unapproved Cross-Module Side Effect
```

If Programme template application requires interaction with Activities, Departments, Staff, Audit, or another StoreOps module, the Planner must identify the approved existing interaction mechanism.

The prompt does not prescribe that mechanism.

---

## 6. Domain and Ownership Boundary

The feature may involve multiple StoreOps concepts:

```text
Programme
Template
Activity / Task
PLANOGRAM
Department
Priority
Store
Audit
Business Events
```

The Planner must determine which module owns each concept.

The implementation must not move ownership merely to simplify the feature.

In particular:

```text
Programme Module
    ≠ automatic owner of Activity persistence

Activity Module
    ≠ automatic owner of Template definitions

Template Definition
    ≠ automatic new domain module

Programme API
    ≠ permission for direct access to another module's repository
```

Ownership must follow existing StoreOps evidence and active architecture rules.

---

## 7. Sprint Decomposition

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

A possible decomposition may distinguish:

```text
Template Definition / Resolution
        ↓
Template Application
        ↓
Activity / Task Creation
        ↓
Audit / Event Integration where applicable
```

This is illustrative only.

It does not prescribe sprint boundaries.

The Planner remains responsible for the actual sprint decomposition.

Each sprint must remain:

- bounded in scope;
- independently testable;
- independently evaluable;
- traceable to this feature intent;
- architecture-aware; and
- suitable for independent Generator/Evaluator execution.

---

## 8. Acceptance Criteria

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
Valid Programme
Programme Eligibility
Valid Planogram Template
Multiple Template Tasks
PLANOGRAM Semantics
Initial Task / Activity State
Department Assignment
Default Priority
Override / Precedence Rules
Unknown Programme
Unknown Template
Inactive Template
Invalid Template
Missing Department
Invalid Priority
Authorization
Duplicate Application
Concurrency / Idempotency
Transaction / Failure Behavior
Audit / Traceability
Applicable Business Events
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

## 9. Testing Intent

The implementation must include automated tests sufficient to demonstrate the approved business behavior.

Tests should cover, where applicable:

```text
Valid Template Application
Multiple Task Creation
PLANOGRAM Task Creation
Initial Task / Activity State
Department Assignment
Default Priority Application
Override / Precedence Behavior
Programme Relationship
Store Relationship
Unknown Programme
Ineligible Programme
Unknown Template
Inactive Template
Empty Template
Invalid Template Task
Missing Department
Invalid Department Mapping
Invalid Priority
Unauthorized Request
Duplicate Template Application
Repeated Request / Idempotency
Concurrent Template Application
Partial Creation Failure
Transaction Behavior
Audit Behavior
Applicable Business-Event Behavior
Application Error Behavior
Existing Programme Regression
Existing Activity / Task Regression
```

Exact test frameworks, coverage thresholds, commands, static-analysis checks, architecture checks, security checks, and hard gates are resolved from the active technology and governance configuration.

This prompt does not define those values.

---

## 10. Existing Application Compatibility

The implementation must integrate with the existing StoreOps application rather than create parallel application models.

The Planner and Generator must prefer existing:

```text
Programme Models
Programme Services
Activity / Task Models
Activity / Task Services
TaskCategory
Priority Semantics
Department Models
Store Relationships
Template Concepts
Configuration Patterns
Authorization
Application Error Handling
Audit Mechanisms
Business Events
Transaction Patterns
Concurrency Patterns
Testing Conventions
Module Boundaries
```

where they satisfy the approved contract.

Avoid unnecessary:

- framework changes;
- package restructuring;
- new dependencies;
- duplicate Programme models;
- duplicate Activity/Task models;
- duplicate Department models;
- duplicate Priority models;
- duplicate template infrastructure;
- new authorization mechanisms;
- new audit infrastructure;
- new event infrastructure; and
- unrelated refactoring.

---

## 11. Scope Control

The feature scope is limited to the behavior required to demonstrate Planogram Task Template application.

Do not expand the feature into unrelated capabilities such as:

```text
Generic Template Management Platform
Template Designer UI
Template Marketplace
Generic Workflow Engine
New Programme Lifecycle
New Activity Lifecycle
New Department Hierarchy
New Priority Model
New Identity Platform
New Audit Platform
New Event Platform
StoreOps-Wide Refactoring
Deployment Infrastructure Changes
```

unless repository evidence demonstrates that an existing approved mechanism must be extended to satisfy the feature.

Material scope changes require explicit review through the governed harness workflow.

---

## 12. Harness Integration

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

## 13. Required Planner Outputs

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
Programme Findings
PLANOGRAM Findings
Template Findings
Activity / Task Creation Findings
Initial-State Findings
Department Findings
Priority Findings
Override / Precedence Findings
Authorization Findings
Transaction Findings
Concurrency / Idempotency Findings
Audit Findings
Business-Event Findings
Application Error Findings
Architecture Constraints
Assumptions
Open Questions
Sprint Decomposition
Dependencies
Risks
```

Each sprint contract must use the mandatory structure defined by the active sprint-contract template.

The Planner must not begin implementation.

---

## 14. Human Approval

After producing the specification and sprint contracts, Planner must stop with:

```text
STATUS: AWAITING_APPROVAL
```

Implementation begins only after the configured human approval command is received.

Human review should explicitly confirm:

```text
Endpoint Contract
Programme Eligibility
PLANOGRAM Semantics
Template Definition / Source
Template Identification / Versioning
Task / Activity Creation
Initial Task / Activity State
Department Assignment
Default Priority
Override / Precedence Rules
Authorization
Duplicate / Idempotency Behavior
Transaction / Failure Semantics
Audit Behavior
Business-Event Behavior
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

## 15. Completion Intent

The feature is complete when the approved implementation demonstrates:

```text
Authorized Template-Application Request
        ↓
Resolve Target Programme
        ↓
Validate Programme Eligibility
        ↓
Resolve Approved Planogram Template
        ↓
Validate Template Definition
        ↓
For Each Approved Template Task
        │
        ├── Resolve PLANOGRAM Semantics
        │
        ├── Resolve Initial State
        │
        ├── Resolve Department Assignment
        │
        ├── Resolve Default Priority
        │
        └── Create Programme Activity / Task
        ↓
Apply Approved Transaction Semantics
        ↓
Create Required Audit / Traceability Evidence
where applicable
        ↓
Perform Only Established and Approved
Business-Event Behavior
        ↓
Return Approved API Outcome
```

The implementation mechanism, template storage, task-creation mechanism, cross-module interaction, transaction handling, audit integration, business-event behavior, architecture, testing, evaluation, deployment, rollback, and governance mechanisms must be determined by the active configuration, existing StoreOps design, and approved sprint contracts.

**This prompt does not prescribe the implementation mechanism.**

The final implementation must preserve existing StoreOps Programme ownership, Activity/Task ownership, department semantics, priority semantics, authorization, application error behavior, transaction conventions, business-event ownership, backward compatibility, module boundaries, and governed harness controls.
