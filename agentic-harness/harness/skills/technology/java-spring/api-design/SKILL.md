# Java/Spring API Design
## Purpose
Provide reusable Java/Spring API-design guidance for the harness agents that consume technology-implementation guidance: Generator and, where applicable, Evaluator.
This skill applies when the active technology profile identifies Java/Spring as the technology stack.
It focuses on API design at the code and contract level for the API style selected by the active technology profile.
It does not encode:
application/domain business rules;
application/domain architecture rules;
StoreOps-specific error types;
feature-specific endpoints, resource names, or workflows;
test-framework or test-behavior rules;
general Java coding conventions;
governance thresholds;
scoring, verdict, or iteration rules;
verification commands;
security thresholds;
deployment or rollback controls; or
harness orchestration.
Those concerns remain owned by the applicable application/domain skills, the active technology profile, the sibling technology skills, the governance policy, the harness orchestration, and the deployment lifecycle.
---
Scope
This skill applies when the resolved technology profile selects Java/Spring for API implementation.
Guidance must be interpreted together with:
```text
Active Technology Profile
Approved Sprint Contract
Resolved Configuration
Existing Application Source
Existing Application API Conventions
Existing API Contracts
Active Application / Domain Rules
Active Application / Domain Architecture Rules
Active Application / Domain Error Contract
Active Governance Policy
```
The existing application's API conventions and contracts remain authoritative when they conflict with general guidance described here.
The approved sprint contract remains authoritative when it defines feature-specific API behavior.
---
API Style Selection
The API style is determined by the resolved technology profile such as:
```text
.harness/config/technologies/java-spring.yaml
```
Where the resolved profile specifies:
```text
API Style: REST
```
REST-oriented guidance applies.
Where the resolved profile specifies another supported API style, guidance below that is REST-specific does not apply.
This skill does not require any particular API style.
It does not require a specific transport, protocol, media type, or serialization format.
Resolved technology-profile values remain authoritative.
---
API-Design Boundary
This skill defines:
```text
Reusable API-Design Guidance for the Selected API Style
Endpoint / Resource-Model Guidance
HTTP-Semantics Guidance (when REST is active)
Request / Response DTO Guidance
Validation Guidance at API Boundary
Versioning Guidance
Pagination / Filtering / Sorting Guidance (when applicable)
Consistent API Error-Response Guidance (deferring to the active error contract)
Backward-Compatibility Guidance for Existing Contracts
```
This skill does not define:
```text
Application Architecture (Layering, Modules, Boundaries)
Application Domain Rules
StoreOps-Specific Error Types (for example, AppError semantics)
General Java Coding Conventions
Test Frameworks or Test Behavior
Coverage Thresholds
Static Analysis Thresholds
Security Policy Thresholds
Authentication / Authorization Mechanisms
Verification / Build Commands
Deployment or Rollback Controls
Evaluation Verdicts
Orchestration Statuses
```
Those responsibilities remain with the applicable application/domain skills, sibling technology skills, governance policy, active configuration, and harness orchestration.
---
Existing-Application Preservation
Generator must inspect the existing Java/Spring API surface before applying general guidance.
Prefer:
```text
Existing Endpoint Patterns
Existing Resource Naming
Existing HTTP Method Usage
Existing HTTP Status Semantics
Existing Request / Response DTO Structures
Existing Validation Strategy
Existing Error-Response Structure
Existing Versioning Strategy
Existing Pagination / Filtering / Sorting Conventions
Existing Media Types and Serialization Behavior
```
over introducing new conventions.
A new API convention must not be introduced merely because it is technically possible or perceived as better.
Convention changes must be captured through:
```text
PROMPT.md
   ↓
Planner Discovery
   ↓
Approved Sprint Contract
```
Generator must not silently introduce large-scale API refactoring outside approved scope.
---
Resource-Oriented Design (When REST Is Active)
When the resolved technology profile selects REST, apply resource-oriented design guidance.
Reusable guidance:
design endpoints around resources rather than actions;
use nouns for resource paths and reserve verbs for HTTP methods;
keep resource semantics consistent with the existing API surface;
avoid overloading a single endpoint with unrelated responsibilities;
avoid introducing "RPC-style" endpoints when resource-oriented alternatives already fit the existing conventions;
prefer stable, predictable resource identifiers; and
keep resource hierarchies aligned with the existing application/domain model.
Exact resource paths, hierarchies, identifiers, and casing follow the existing application conventions.
This skill does not enumerate specific paths.
---
HTTP Method Semantics (When REST Is Active)
When REST is active, use HTTP methods consistently with the existing application and standard HTTP semantics.
Reusable guidance:
reads should not modify state;
unsafe operations should not be exposed as safe methods;
idempotent operations should be idempotent as exposed through the API;
creation operations should be modeled consistently with existing patterns;
update operations should preserve the existing semantics of partial versus full updates as established by the application; and
deletion operations should preserve the existing semantics established by the application.
Do not silently change existing HTTP method usage for a resource.
Do not add new methods to a resource merely because HTTP allows them.
---
HTTP Status Semantics (When REST Is Active)
Use HTTP status semantics consistently with the existing application and standard HTTP semantics.
Reusable guidance:
align statuses with the outcome the API represents;
align statuses with the existing application's response patterns;
distinguish client-caused errors from server-caused errors;
distinguish validation failures from operational failures where the application already does so;
avoid inventing new status semantics that conflict with existing endpoints; and
avoid using a single status code to represent unrelated outcomes.
Exact status codes for specific scenarios are determined by the existing application, the approved sprint contract, and the active application/domain error contract.
This skill does not enumerate mandatory status codes for specific scenarios.
---
Request and Response DTOs
Use request and response DTOs consistently with the existing application.
Reusable guidance:
separate API-level DTOs from internal domain models where the application already does so;
avoid exposing internal domain models directly through the API when the application already uses DTOs;
design request DTOs around the API's input needs, not around persistence;
design response DTOs around the API's output needs;
prefer immutable DTOs where consistent with the existing application;
avoid mixing input and output concerns in the same DTO where the application already separates them;
prefer clear field naming aligned with the domain vocabulary; and
prefer forward-compatible field design for optional or evolving attributes.
Serialization formats, field naming strategies, and media types remain application- and profile-defined.
---
Input Validation
Validate inputs at the API boundary consistently with the existing application.
Reusable guidance:
validate structural and syntactic requirements at the API boundary;
validate semantic business requirements at the appropriate layer as established by the application;
provide clear, actionable validation errors;
avoid duplicating validation across layers in a way that produces inconsistent behavior;
avoid silent normalization of user input that changes meaning;
avoid returning successful responses for structurally invalid input; and
avoid exposing internal validation implementation detail through error responses.
Exact validation rules for a feature are determined by the approved sprint contract and the applicable domain rules.
This skill does not enumerate feature-specific validation rules.
---
API Error Responses
Error responses must be consistent with the active application/domain error contract.
Reusable guidance:
align API error responses with the existing error-response structure;
align API error responses with the active application/domain error contract semantics;
avoid introducing raw exceptions or ad hoc error structures that bypass the active error contract;
avoid leaking internal exception details, stack traces, secrets, or sensitive information through the API;
provide sufficient context for the caller to diagnose the outcome without exposing internal state;
preserve consistent error response semantics across related endpoints; and
preserve consistent error response semantics for negative paths defined by the approved sprint contract.
The exact error-response schema, error codes, exception hierarchy, and mapping to HTTP semantics are supplied by:
```text
Active Application / Domain Error Contract
Existing Application
Approved Sprint Contract
```
For example, when the active application defines a typed application-error hierarchy, API error responses must integrate with that hierarchy.
Specific error types are not enumerated here.
---
Versioning
Follow the existing application's versioning strategy.
Reusable guidance:
do not introduce a new versioning strategy when one is already established;
do not silently break existing API contracts;
preserve backward compatibility for existing consumers where required by the application; and
treat versioning changes as material contract changes that require approval.
Exact versioning mechanisms follow the existing application and resolved technology profile.
---
Backward Compatibility
Preserve backward compatibility for existing API contracts unless the approved sprint contract explicitly authorizes a breaking change.
Reusable guidance:
do not remove existing endpoints without approval;
do not remove existing fields without approval;
do not change existing field semantics without approval;
do not change existing HTTP method or status semantics for existing endpoints without approval;
prefer additive, opt-in changes over breaking changes; and
flag any potential backward-compatibility impact through the approved contract-change workflow.
Generator must not silently make breaking changes to established API contracts.
---
Pagination, Filtering, and Sorting
Apply pagination, filtering, and sorting only when the resolved technology profile, existing application, or approved sprint contract requires them.
Reusable guidance:
follow existing pagination, filtering, and sorting patterns where they exist;
do not introduce a new pagination style when one is already established;
preserve deterministic ordering when the application already relies on it;
avoid exposing internal query semantics through public API parameters;
validate pagination and filtering inputs at the API boundary; and
align pagination, filtering, and sorting behavior with the existing response DTOs.
Exact parameter names and semantics remain application-defined.
---
Idempotency, Concurrency, and Consistency
Where idempotency, concurrency control, or consistency semantics are required at the API boundary, follow the existing application's approach.
Reusable guidance:
do not assume idempotency for operations that the application treats as non-idempotent;
do not assume non-idempotency for operations that the application treats as idempotent;
follow existing conditional-request patterns where the application already uses them;
avoid inventing new concurrency-control mechanisms when the application already provides one; and
avoid changing the transactional or consistency guarantees of existing endpoints without approval.
Specific idempotency, concurrency, or consistency semantics for a feature are determined by the approved sprint contract and active application/domain rules.
---
API Security
This skill does not define authentication or authorization mechanisms.
Reusable guidance:
follow the existing application's authentication mechanism;
follow the existing application's authorization mechanism;
do not weaken existing security controls at the API boundary;
do not expose internal identifiers, tokens, or secrets through responses;
do not introduce new public endpoints outside approved scope;
treat security-relevant changes as material contract changes that require approval; and
align with the active application/domain rules for role and permission semantics.
Specific authentication, authorization, and security-policy semantics are supplied by the active application/domain context and the approved sprint contract.
Security thresholds, verification commands, and hard gates remain governance-owned.
---
Observability at the API Boundary
Emit only observability signals that are consistent with the existing application's approach.
Reusable guidance:
follow the existing logging strategy;
follow the existing metrics/tracing strategy where established;
do not log secrets, credentials, tokens, or sensitive personal information;
do not log request or response payloads at levels that expose sensitive information;
prefer structured logging where the application already uses it; and
avoid introducing new observability frameworks outside approved scope.
Governance-observability recording remains the responsibility of the harness Monitor and is described by:
```text
core/observability/SKILL.md
```
This skill does not redefine harness observability semantics.
---
Architecture Boundary
This skill does not define:
```text
Layering (Controller → Service → Repository)
Module Boundaries
Cross-Module Repository Rules
Cross-Module Read Rules
Cross-Module Side-Effect Mechanisms
Approved Integration Mechanisms
Reports Read-Only Constraints
```
Architecture constraints belong to the active application/domain architecture rules.
For the StoreOps reference application, these are supplied by:
```text
domains/storeops/architecture-rules/SKILL.md
```
API code produced by Generator must preserve whatever architecture is active and approved.
Controllers should remain within the responsibilities established by the active architecture (for example, transport concerns, input validation at the boundary, and delegation to services) rather than absorbing business logic or persistence responsibilities.
The specific division of responsibilities remains architecture-owned, not API-skill-owned.
---
Domain and Feature Boundary
This skill does not define:
```text
StoreOps Business Rules
SLA Breach Alerting Endpoints
SLA Eligibility
Notification / Escalation Recipients
Configured Grace Periods
Event Names such as SLA_BREACH
StoreOps AppError Semantics
Roles and Feature Bindings
```
Domain semantics are supplied by:
```text
domains/storeops/domain-rules/SKILL.md
```
Application/module context is supplied by:
```text
domains/storeops/app-context/SKILL.md
```
Architectural constraints, including the active error contract, are supplied by:
```text
domains/storeops/architecture-rules/SKILL.md
```
Business-event knowledge is supplied by:
```text
domains/storeops/business-events/SKILL.md
```
Feature-specific behavior, including any SLA-related endpoints, flows through:
```text
PROMPT.md
   ↓
Planner Discovery
   ↓
Approved Sprint Contract
```
Generator must not embed feature-specific API rules into general API-design guidance.
---
Coding-Convention Boundary
General Java/Spring coding conventions belong to:
```text
technology/java-spring/coding-conventions/SKILL.md
```
This skill does not define:
```text
Language-Level Coding Conventions
Dependency Injection Style
Package Structure Rules
Naming Conventions Beyond API-Level Concerns
Concurrency Patterns
Logging Framework Selection
Configuration Mechanism Selection
Secret Handling Mechanism
```
References here to controllers, DTOs, validation, or logging apply only from an API-design perspective.
---
Testing Boundary
Test-framework selection, test types, test behavior, coverage, and testing strategy are not part of this skill.
Testing guidance belongs to:
```text
technology/java-spring/testing-strategy/SKILL.md
```
This skill does not require specific API test frameworks, mocking approaches, integration-test styles, or coverage numbers.
---
Build, Verification, and Static Analysis Boundary
This skill does not define:
```text
Build Tools
Build Plugins
Build Commands
Test Commands
Coverage Commands
Coverage Tools
Static Analysis Tools
Security Verification Tools
CI/CD Behavior
```
Those values are resolved from the active technology profile and governance policy.
Generator executes only configured verification commands.
Evaluator applies only configured checks and thresholds.
---
Governance and Orchestration Boundary
This skill does not define:
```text
Hard Gates
Coverage Thresholds
Scoring Dimensions
Scoring Weights
Verdict Thresholds
Fail-Closed Policy
maxIterations
Retry Policy
Escalation Policy
```
It does not define:
```text
STATUS: AWAITING_APPROVAL
STATUS: READY_FOR_EVALUATION
STATUS: CONTRACT_CHANGE_REQUIRED
STATUS: COMPLETED
PASS
CONDITIONAL_PASS
FAIL
```
Agent definitions, `CLAUDE.md`, and the active governance policy remain authoritative for orchestration and evaluation behavior.
---
Evidence Boundary
This skill does not define runtime evidence filenames, output paths, or review/archive paths.
Canonical evidence naming and locations remain controlled by the harness baseline and resolved configuration.
This skill does not redefine:
```text
generator-summary-iteration-N.md
evaluator-feedback-iteration-N.md
run-log.md
escalation.md
```
as API-design concepts.
---
Change Minimization
Generator must prefer the smallest API change that satisfies the approved sprint contract while respecting these conventions.
Avoid:
unrelated endpoint refactoring;
unnecessary changes to DTO structures;
new endpoints introduced outside approved scope;
new query parameters introduced solely for stylistic reasons;
changes to established naming that break existing conventions;
silent versioning changes;
silent breaking changes to existing endpoints; and
pattern changes across previously consistent endpoints.
Existing application API conventions take precedence over newly invented API patterns unless the approved contract explicitly requires a change.
---
Planner Usage
Planner may reference this skill when API constraints materially affect scope, decomposition, or acceptance criteria and the baseline permits it.
Planner must not:
own Java/Spring API-implementation decisions;
prescribe specific endpoint paths, DTO fields, or status codes;
introduce new API styles beyond the resolved technology profile;
introduce breaking changes to established API contracts; or
embed technology-specific implementation into the sprint contract beyond what the approved intent requires.
Planner may reference this skill to describe technology-context assumptions used during discovery.
---
Generator Usage
Generator uses this skill to implement approved Java/Spring APIs consistently with the existing application, active technology profile, active application/domain rules, and active error contract.
Generator must:
follow existing API conventions;
apply reusable API-design principles described here;
integrate with the active application/domain rules and architecture rules;
integrate with the active error contract;
integrate with the approved sprint contract; and
avoid unrelated changes to the API surface.
Generator must not:
override active application/domain rules;
override the active technology profile;
override the active governance policy;
introduce structural API changes outside approved scope; or
create parallel API patterns that duplicate existing responsibilities.
If implementation requires a material change to API conventions, versioning, contracts, or error responses, Generator must use the applicable contract-change workflow rather than silently modifying the API.
---
Evaluator Usage
Evaluator uses this skill only for semantic review of Java/Spring API design and convention consistency, where applicable and required by the approved sprint contract and active governance policy.
Evaluator may consider:
```text
Consistency With Existing API Conventions
Adherence to Reusable API-Design Principles Described Here
Alignment With Active Application / Domain Rules
Alignment With the Active Application / Domain Error Contract
Alignment With the Active Technology Profile
Alignment With the Approved Sprint Contract
```
Evaluator must not:
introduce new API conventions during evaluation;
fail implementation for API-design choices that the existing application already accepts;
fail implementation for reasonable API choices when the approved contract does not require otherwise;
override deterministic tool results with subjective API-design opinions; or
interpret this skill as a set of hard gates.
Hard gates, coverage thresholds, and scoring rules remain governance-owned.
---
Monitor Usage
Monitor does not require this skill for governance-observability recording.
Monitor records canonical execution evidence and preserves Evaluator verdicts without interpreting Java/Spring API-design semantics.
---
Responsibility Boundaries
This skill provides reusable Java/Spring API-design guidance.
It does not:
prescribe application architecture;
prescribe domain rules;
prescribe application error types;
prescribe general coding conventions;
prescribe testing strategy;
prescribe governance thresholds;
prescribe evaluation scoring;
prescribe hard gates;
prescribe iteration limits;
prescribe evidence naming;
prescribe orchestration statuses;
authorize retries;
authorize escalation;
authorize contract changes;
deploy software;
perform rollback; or
perform reflection.
The responsibility flow remains:
```text
PROMPT.md
   ↓
Planner Discovery
   ↓
Approved Sprint Contract
   ↓
Generator Implementation
   ↓
Evaluator Verification
   ↓
Monitor Evidence Recording
```
---
Configuration Ownership
This skill must not duplicate authoritative values owned elsewhere.
Configuration- or governance-owned examples include:
```text
Application Paths
Exact Language / Framework / Plugin Versions
API Style Selection
Build Tools and Commands
Test Commands
Coverage Commands
Coverage Thresholds
Static Analysis Commands
Static Analysis Thresholds
Architecture Verification Commands
Security Commands and Thresholds
Hard Gates
Scoring Dimensions
Scoring Weights
Verdict Thresholds
Fail-Closed Policy
maxIterations
Approval Commands
Output Paths
Review Paths
Deployment Controls
Rollback Controls
```
This skill defines:
```text
Reusable Java/Spring API-Design Guidance
```
Sibling technology skills define:
```text
Coding Conventions (technology/java-spring/coding-conventions)
Testing Strategy (technology/java-spring/testing-strategy)
```
Application/domain skills define:
```text
Application Context, Domain Rules, Architecture Rules, Business Events
```
Configuration defines:
```text
Applicable Runtime Values, Including Selected API Style
```
Governance policy defines:
```text
Evaluation and Decision Policy
```
The approved sprint contract defines:
```text
Feature-Specific Approved Scope
+
Applicable API Behavior Beyond These General Conventions
```
