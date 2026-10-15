# FlowWeft — Failure & Recovery Proof v7

## Mandatory injected failures
- malformed input
- clock skew
- duplicate event
- schema mismatch
- ClickHouse lag
- feature worker backlog
- cardinality explosion
- privacy redaction failure
- model mismatch

## Pass criteria
For every failure: no invariant violation; no unauthorized bypass; no unbounded retry storm; orphan resources are reconciled; user-visible state becomes correct; telemetry identifies cause; retry/cancel/manual recovery is documented; recovery test is automated where feasible.
