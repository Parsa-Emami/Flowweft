# FlowWeft — Final Implementation Specification

This specification freezes the v1 implementation contract. Changes that violate an invariant, authority boundary or public contract require an ADR/RFC and migration/compatibility plan.

## Required signals
- `flowweft_ingest_rows_per_second`
- `flowweft_ingest_lag_seconds`
- `flowweft_detector_latency_seconds`
- `flowweft_schema_mismatch_total`
- `flowweft_drift_score`
- `flowweft_inference_queue_age_seconds`

Also emit common RED/USE signals, queue age/retry/dead-letter, datastore latency/error, external-adapter error class, build/version/config revision and projection lag.

## Trace contract
A correlation/trace crosses HTTP/CLI entry -> application command -> DB transaction/outbox -> worker/engine -> adapter/store -> projection/event. Async propagation uses explicit trace context.

## Logging
Structured logs; stable event names; actor/resource IDs only when policy permits; no credentials, plaintext secrets, raw tokens, unnecessary evidence/source content or sensitive model rows. A redaction test is part of CI.

## Audit != logs
Security audit records are a deliberate, queryable domain record with retention/integrity rules; operational logs can rotate independently.
