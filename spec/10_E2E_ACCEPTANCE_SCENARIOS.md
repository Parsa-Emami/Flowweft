# FlowWeft — Final Implementation Specification

This specification freezes the v1 implementation contract. Changes that violate an invariant, authority boundary or public contract require an ADR/RFC and migration/compatibility plan.

## Golden E2E scenarios
1. Zeek fixture -> normalized observed flow -> deterministic features
2. Statistical baseline produces explainable anomaly
3. Isolation Forest model binds exact feature schema
4. Schema mismatch rejects inference
5. Time-aware evaluation prevents train/test overlap
6. Backpressure saturation remains bounded

For every golden scenario record expected authoritative state, emitted event IDs/types, audit action, projection state, critical metrics and cleanup state. Run from a clean environment with deterministic synthetic fixtures. At least one scenario must fail mid-flight and then converge after restart/retry/reconciliation.
