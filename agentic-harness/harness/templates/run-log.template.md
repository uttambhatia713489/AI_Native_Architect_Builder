# Run Log Template

Runtime instantiation: `.harness/output/<run-id>/run-log.md`

This template records governance-observability evidence for a harness run.

It preserves execution history derived from canonical durable evidence and harness execution metadata.

It does not:

- issue or reinterpret Evaluator verdicts;
- define governance thresholds;
- define hard gates;
- define scoring weights or verdict thresholds;
- define `maxIterations`;
- authorize retries or escalation;
- determine sprint progression or run completion;
- replace Generator or Evaluator evidence;
- replace CI/CD independent revalidation; or
- define deployment, rollback, or reflection behavior.

The active governance policy, resolved configuration, agent definitions, and `CLAUDE.md` remain authoritative for those responsibilities.

---

## Run Metadata

```text
Run ID:                 <RUN_ID>
Application:            <resolved application id>
Technology:             <resolved technology profile id>
Governance Policy:      <resolved governance policy id>
Feature Prompt:         <path/to/PROMPT.md>
Specification:          .harness/output/<RUN_ID>/spec.md
Resolved Configuration: .harness/output/<RUN_ID>/resolved-config.yaml
Run Started At:         <timestamp or N/A>
Run Completed At:       <timestamp or N/A>
```

Timestamps must be derived from available harness execution metadata.

Do not fabricate unavailable timestamps.

---

## Run Evidence

Reference the canonical run-level evidence available for this execution.

```text
Feature Prompt:          <path/to/PROMPT.md>
Specification:           <path/to/spec.md>
Resolved Configuration:  <path/to/resolved-config.yaml>
Sprint Contracts:        <list of sprint-N-contract.md references>
Escalation Evidence:     <path/to/escalation.md or N/A>
```

This log references authoritative evidence rather than duplicating its complete content.

---

## Sprint History

Record each sprint independently.

Example structure:

```text
Sprint ID:               <SPRINT_ID>
Contract ID:             <CONTRACT_ID>
Sprint Contract:         <path/to/sprint-N-contract.md>
Iterations Used:         <count>
Final Evaluator Verdict: <PASS / CONDITIONAL_PASS / FAIL / N/A>
Escalation Status:       <status determined by harness or N/A>
Sprint Started At:       <timestamp or N/A>
Sprint Concluded At:     <timestamp or N/A>
```

The Monitor records the sprint outcome only after the harness determines that the sprint has concluded.

Monitor does not independently determine sprint completion.

Repeat for each sprint.

---

## Iteration History

Record every Generator/Evaluator iteration independently and preserve iteration ordering.

Example structure:

```text
Sprint ID:               <SPRINT_ID>
Contract ID:             <CONTRACT_ID>
Iteration:               <N>

Generator Evidence:
  <path/to/generator-summary-iteration-N.md>

Evaluator Evidence:
  <path/to/evaluator-feedback-iteration-N.md>

Evaluator Verdict:
  <PASS / CONDITIONAL_PASS / FAIL>

Findings / Violations:
  <summary or evidence reference>

Quality Evidence:
  <summary or evaluator evidence reference>

Escalation Status:
  <status determined by harness or N/A>

Iteration Started At:
  <timestamp or N/A>

Iteration Evaluated At:
  <timestamp or N/A>
```

Detailed deterministic quality evidence remains authoritative in:

```text
evaluator-feedback-iteration-N.md
```

Detailed implementation and Generator verification evidence remains authoritative in:

```text
generator-summary-iteration-N.md
```

The run log should summarize or reference those artifacts rather than duplicate their complete contents.

---

## Deterministic Quality Summary

Where available, record a concise summary or reference for configured deterministic checks.

Example structure:

| Sprint | Iteration | Build | Tests | Coverage | Static Analysis | Architecture | Security | Evaluator Evidence |
|---|---:|---|---|---|---|---|---|---|
| `<SPRINT_ID>` | `<N>` | `<result or N/A>` | `<result or N/A>` | `<result or N/A>` | `<result or N/A>` | `<result or N/A>` | `<result or N/A>` | `<reference>` |

Use:

```text
N/A
```

when a check is not configured, not applicable, or the result is unavailable.

Do not infer or fabricate quality results.

The Evaluator evidence remains authoritative for detailed check results, configured requirements, hard-gate outcomes, and findings.

---

## Acceptance-Criteria Summary

Where useful for traceability, record the Evaluator's acceptance-criteria outcome by reference.

Example structure:

```text
Sprint ID:          <SPRINT_ID>
Iteration:          <N>
ACs Passed:         <count or N/A>
ACs Failed:         <count or N/A>
ACs Ambiguous:      <count or N/A>
Evaluator Evidence: <path/to/evaluator-feedback-iteration-N.md>
```

Do not independently evaluate acceptance criteria in the run log.

---

## Findings Summary

Record only evidence-derived findings information.

Example structure:

```text
Sprint ID:              <SPRINT_ID>
Iteration:              <N>
Mandatory Findings:     <count or N/A>
Non-Blocking Findings:  <count or N/A>
Findings Reference:     <path/to/evaluator-feedback-iteration-N.md>
```

Do not reinterpret finding severity or create new findings.

---

## Verdict History

Preserve Evaluator verdicts exactly as issued.

Example structure:

| Sprint | Contract | Iteration | Evaluator Verdict | Evidence |
|---|---|---:|---|---|
| `<SPRINT_ID>` | `<CONTRACT_ID>` | `<N>` | `<PASS / CONDITIONAL_PASS / FAIL>` | `<evaluator evidence reference>` |

Monitor must not:

- change a verdict;
- reinterpret a verdict;
- convert `CONDITIONAL_PASS` into mandatory human intervention unless the active governance policy explicitly requires it;
- determine whether another iteration is permitted; or
- determine whether the run is complete.

---

## Escalation History

Record escalation only when the harness has determined that escalation applies.

Example structure:

```text
Sprint ID:            <SPRINT_ID>
Contract ID:          <CONTRACT_ID>
Iteration:            <N>
Final Evaluator Verdict: <PASS / CONDITIONAL_PASS / FAIL>
Escalation Status:    <status determined by harness>
Escalation Evidence:  <path/to/escalation.md>
Recorded At:          <timestamp or N/A>
```

If no escalation occurred:

```text
Escalation Status: N/A
```

Monitor must not initiate, authorize, resolve, or reinterpret escalation.

---

## Telemetry

Record only telemetry actually available from harness execution metadata or canonical evidence.

Example structure:

```text
Sprint ID:       <SPRINT_ID>
Iteration:       <N>
Token Usage:     <value or N/A>
Estimated Cost:  <value or N/A>
Timestamp:       <timestamp or N/A>
Telemetry Source:<harness metadata reference or N/A>
```

Do not:

- infer token usage;
- fabricate cost;
- estimate unavailable telemetry;
- fabricate performance metrics;
- fabricate quality trends; or
- convert qualitative observations into unsupported numeric metrics.

If a required telemetry field is unavailable, record:

```text
N/A
```

---

## Evidence-Derived