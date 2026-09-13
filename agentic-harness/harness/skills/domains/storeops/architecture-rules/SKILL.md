\# StoreOps Domain Rules



\## Purpose



Provide reusable StoreOps business/domain knowledge to the harness agents that consume domain context: Planner, Generator, and Evaluator.



This skill describes permanent StoreOps domain concepts and rules that exist across features.



It does not encode feature-specific business intent, feature-specific eligibility, feature-specific recipient rules, feature-specific workflows, feature-specific state transitions, or feature-specific configuration.



Those concerns are supplied by the applicable feature prompt (`PROMPT.md`), Planner discovery, and the approved sprint contract.



\---



\## Scope



These rules apply when the resolved application/domain context identifies StoreOps as the active application.



They must be interpreted together with:



```text

StoreOps Application Context

StoreOps Architecture Rules

StoreOps Business Events

Active Technology Profile

Active Governance Policy

Approved Sprint Contract

```



Where an approved sprint contract requires a more specific application of these rules, the approved sprint contract governs the implementation for that sprint.



\---



\## Application Domain



StoreOps supports store operations, including operational activities, programmes, staffing, alerts, and reporting.



The domain includes concepts such as:



\- Activities that represent operational tasks;

\- Programmes that group related work;

\- Staff who own or are associated with operational work;

\- Alerts that represent operational notifications; and

\- Reports that provide read-only views of operational data.



Additional domain concepts may exist in the current StoreOps application and are supplied by the resolved application context.



Planner must inspect the resolved StoreOps application to understand actual domain semantics before finalizing a sprint contract.



\---



\## Activities



Activities are operational units of work in StoreOps.



Activities may have attributes such as:



\- an assigned owner or department;

\- a priority classification;

\- a due date/time;

\- a lifecycle status; and

\- associated audit information.



The exact attribute names, semantics, and lifecycle are defined by the current StoreOps application.



This skill does not redefine attributes or lifecycles.



\---



\## Priorities



StoreOps activities may use a priority classification, including values such as:



```text

LOW

MEDIUM

HIGH

CRITICAL

```



The exact set of supported priorities is determined by the current StoreOps application.



The domain meaning of higher priorities is that they represent more operationally significant work.



This skill does not attach feature-specific meaning to priority values, including:



\- SLA eligibility;

\- notification requirements;

\- escalation triggers; or

\- feature-specific processing behavior.



Feature-specific interpretation of priority is supplied by `PROMPT.md`, Planner discovery, and the approved sprint contract.



\---



\## Activity Status



StoreOps activities may progress through a lifecycle that includes statuses such as:



```text

DONE

```



where the current StoreOps application defines that status as completed.



The full set of statuses, transitions, and completion semantics is defined by the current StoreOps application.



This skill does not:



\- redefine activity lifecycle rules;

\- redefine what counts as resolved beyond the current application's semantics; or

\- attach feature-specific meaning to a status.



Feature-specific interpretation of statuses, including which statuses count as unresolved for a particular feature, is supplied by:



```text

PROMPT.md

&#x20;   ↓

Planner Discovery

&#x20;   ↓

Approved Sprint Contract

```



\---



\## Roles



StoreOps recognizes operational roles used across features.



Examples include:



\- Department Lead;

\- Store Manager (`STORE\_MANAGER`).



Additional roles may exist in the current StoreOps application.



Role definitions are StoreOps domain concepts.



This skill does not define feature-specific role bindings such as:



\- who receives a particular notification;

\- who receives a particular escalation;

\- who approves a feature-specific action; or

\- which role participates in a feature-specific workflow.



Feature-specific role bindings must be determined through Planner discovery and defined in the approved sprint contract.



\---



\## Time Awareness



StoreOps operates on time-dependent concepts including:



\- due dates/times;

\- scheduled work; and

\- lifecycle timestamps.



The exact:



```text

Date/Time Representation

Time Zone

Clock Abstraction

Scheduling Mechanism

```



is determined by the current StoreOps application.



This skill does not:



\- specify a time zone;

\- specify a date/time format;

\- introduce a scheduler;

\- define a grace-period value;

\- define when a feature-specific timer starts; or

\- define feature-specific time-based behavior.



Feature-specific time semantics must be determined through Planner discovery and defined in the approved sprint contract.



\---



\## Configuration



StoreOps behavior may be influenced by application configuration.



The exact configuration surface, keys, values, and defaults are determined by the current StoreOps application and resolved configuration.



This skill does not define feature-specific:



```text

Configuration Keys

Configuration Values

Default Values

Grace Periods

Thresholds

Timers

```



Feature-specific configuration requirements are supplied by the feature prompt, resolved configuration, Planner discovery, and the approved sprint contract.



\---



\## Feature-Specific Business Rules



Feature-specific business rules must not be promoted into permanent StoreOps domain rules unless they are explicitly established as reusable StoreOps domain behavior.



For example, a feature may define behavior involving:



```text

Priority Eligibility

Overdue Conditions

Unresolved Conditions

Notification Recipients

Escalation Recipients

Configured Grace Period

Duplicate Prevention

Idempotency

State Tracking

Time-Based Processing

```



Such behavior remains feature-specific unless the authoritative StoreOps domain baseline establishes it as permanent domain truth.



The expected flow is:



```text

PROMPT.md

&#x20;   ↓

Planner Discovery

&#x20;   ↓

spec.md

&#x20;   ↓

Approved sprint-N-contract.md

&#x20;   ↓

Generator Implementation

&#x20;   ↓

Evaluator Verification

```



This skill must not pre-empt Planner discovery by silently defining unresolved feature semantics.



\---



\## Existing Application Preservation



Planner and Generator must inspect existing StoreOps domain behavior before introducing new domain semantics.



Prefer:



```text

Existing StoreOps Concepts

Existing StoreOps Role Usage

Existing StoreOps Lifecycle Rules

Existing StoreOps Time Handling

Existing StoreOps Configuration Patterns

```



over introducing new domain semantics.



Feature-specific extensions must be captured through:



```text

PROMPT.md

&#x20;   ↓

Planner Discovery

&#x20;   ↓

Approved Sprint Contract

```



and must not be encoded as permanent domain rules in this skill unless they become explicitly approved reusable StoreOps domain behavior.



\---



\## Agent Usage



\### Planner



Planner uses this skill to understand existing StoreOps domain concepts and constraints during discovery.



Planner must not treat this skill as a substitute for:



```text

Feature Prompt

Repository Discovery

Application Configuration

Approved Human Decisions

```



Planner resolves feature-specific ambiguity and records applicable domain behavior in the sprint contract.



\### Generator



Generator uses this skill to preserve StoreOps domain semantics while implementing the approved sprint contract.



Generator must not use this skill to expand feature scope or invent additional business behavior.



\### Evaluator



Evaluator uses this skill to verify that implementation preserves applicable StoreOps domain semantics and satisfies the approved sprint contract.



Evaluator must not introduce new domain requirements that are absent from the approved contract and resolved StoreOps context.



\### Monitor



Monitor does not require this skill for governance evidence recording.



\---



\## Responsibility Boundaries



This skill provides reusable StoreOps domain knowledge.



It does not:



\- prescribe feature-specific business rules;

\- prescribe feature-specific eligibility;

\- prescribe feature-specific notification recipients;

\- prescribe feature-specific escalation recipients;

\- prescribe implementation mechanisms;

\- prescribe architecture rules;

\- prescribe technology-specific implementation details;

\- prescribe governance thresholds;

\- prescribe scoring rules;

\- prescribe iteration limits;

\- prescribe evidence file naming;

\- prescribe orchestration states;

\- prescribe retry or escalation routing;

\- prescribe deployment controls;

\- prescribe rollback controls; or

\- authorize any agent to override a mandatory rule from a higher-precedence source.



Architecture constraints are provided by:



```text

domains/storeops/architecture-rules/SKILL.md

```



Application/domain event knowledge is provided by:



```text

domains/storeops/business-events/SKILL.md

```



Technology-specific conventions are provided by the active technology skill pack.



Governance thresholds and evaluation policy are provided by the active governance policy.



Feature-specific business intent is provided by the applicable feature prompt and approved sprint contract.



\---



\## Configuration Ownership



This skill must not duplicate authoritative values owned elsewhere.



Configuration- or governance-owned examples include:



```text

Application Paths

Technology Stack

Build Commands

Test Commands

Coverage Commands

Coverage Thresholds

Static Analysis Commands

Architecture Verification Commands

Security Commands

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

Permanent StoreOps Domain Concepts and Rules

```



Configuration defines:



```text

Applicable Runtime Values

```



Governance policy defines:



```text

Evaluation and Decision Policy

```



The approved sprint contract defines:



```text

Feature-Specific Approved Scope

\+

Applicable Domain Behavior for the Feature

```

