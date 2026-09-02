# FlowWeft — Final Implementation Specification

This specification freezes the v1 implementation contract. Changes that violate an invariant, authority boundary or public contract require an ADR/RFC and migration/compatibility plan.

## HTTP conventions
- Prefix `/api/v1`; JSON UTF-8; explicit content type.
- Resource IDs are opaque UUID/ULID-style identifiers and authorization is re-evaluated after lookup.
- Cursor pagination for unbounded collections.
- Mutation request/response schemas are versioned in OpenAPI; unknown security-sensitive fields are rejected where ambiguity is dangerous.
- Stable error codes follow the common error standard.

| Method | Route | Purpose | Gate |
|---|---|---|---|
| `POST` | `/ingest/batches` | Register Zeek/CSV batch | auth + validation + idempotency where side-effecting |
| `GET` | `/flows` | Query normalized observed flows | auth + validation + idempotency where side-effecting |
| `POST` | `/detectors/{detector}/evaluate` | Run detector on bounded dataset/window | auth + validation + idempotency where side-effecting |
| `GET` | `/inferences/{id}` | Read inference + explanation/provenance | auth + validation + idempotency where side-effecting |
| `POST` | `/inferences/{id}/labels` | Analyst label | auth + validation + idempotency where side-effecting |
| `GET` | `/models/{model}/evaluations` | Read evaluation/drift evidence | auth + validation + idempotency where side-effecting |

## Compatibility
Additive compatible changes may ship in v1. Removing/renaming/changing semantics requires deprecation + migration and normally a new API major. Golden request/response fixtures run in CI.
