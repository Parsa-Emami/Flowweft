# ADR 0004 — FlowWeft reference decision

**Status:** Accepted for v1

## Decision
TelemetryEnvelope v1 has schema_id/version, source, event_time, ingest_time, provenance, privacy labels and deterministic event identity.

## Consequences
Implementation and tests must preserve this boundary. An alternative is allowed only through the relevant port/adapter when it preserves authority, public contracts, security invariants and migration semantics.

## Revisit trigger
Measured benchmark, security evidence, maintenance/licensing change or operational incident demonstrates the reference choice no longer satisfies the declared workload/threat model. Revisit via a new superseding ADR; never silently rewrite history.
