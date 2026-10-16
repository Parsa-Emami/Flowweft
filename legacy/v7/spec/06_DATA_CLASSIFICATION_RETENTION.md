# FlowWeft — Final Implementation Specification

This specification freezes the v1 implementation contract. Changes that violate an invariant, authority boundary or public contract require an ADR/RFC and migration/compatibility plan.

| Data class | v1 rule |
|---|---|
| raw flow telemetry | ClickHouse/object policy; minimized and time-bounded |
| model/evaluation metadata | retained for reproducibility |
| analyst labels | retain provenance and corrections |
| inferences | security/analytics retention separate from raw source |

## Classification labels
`PUBLIC`, `INTERNAL`, `CONFIDENTIAL`, `SECRET`, plus project-specific `EVIDENCE`/`SECURITY_TELEMETRY`. Classification drives logging, export, encryption, backup and retention behavior.

## Deletion
Deletion is an explicit domain operation with authorization, hold checks, audit and downstream projection/cache invalidation. Derived stores must not resurrect deleted authoritative data during rebuild.
