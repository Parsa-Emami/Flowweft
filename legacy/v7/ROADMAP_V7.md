# FlowWeft — Definitive Sequential Roadmap v7

**Portfolio order:** 3 / 10
**Complexity:** High
**Planning estimate:** 10–16 focused weeks (not a promise; recalibrate after Phase 1)

**Why this order:** Good early project after deterministic foundations; must resist jumping to ML before ingestion, provenance and baseline correctness are proven.

## First executable proof
Synthetic Zeek/CSV → normalized observed flows → deterministic baseline → inference/provenance → duplicate/reordered input preserves stable IDs.

## Rules for this repository
- One phase at a time; no implementation work for phase N+1 before phase N exit evidence is merged.
- Contract/schema changes precede dependent implementation.
- Every retryable operation is idempotent.
- Every derived store/projection has a rebuild path.
- Negative and failure tests are part of the feature, not post-release hardening.
- Status claims must be evidence-backed.

## Phase 0 — Telemetry schema/provenance

**Implementation deliverables**
- Define normalized flow/event schema
- Stable source/event IDs
- Timestamp/timezone and clock-quality policy
- Dataset provenance manifest

**Required verification**
- schema fixtures
- ID stability tests
- timestamp edge cases

**Definition of Done**
- Same source data normalizes to stable identities with explicit provenance and clock assumptions.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 1 — Zeek/CSV ingestion

**Implementation deliverables**
- Streaming parsers
- Malformed record quarantine
- Idempotent/replayable ingestion
- Backpressure and batch boundaries

**Required verification**
- parser fuzz
- duplicate/reorder tests
- partial batch failure tests

**Definition of Done**
- Re-ingesting the same files does not duplicate normalized observations and malformed rows are isolated.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 2 — ClickHouse partition/query model

**Implementation deliverables**
- Partition/order key design from measured query patterns
- Retention/TTL policy
- Derived-store rebuild path from raw/normalized evidence
- Query budget limits

**Required verification**
- rebuild test
- partition benchmark
- retention tests

**Definition of Done**
- ClickHouse can be dropped/rebuilt and meets measured primary query budgets at target synthetic scale.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 3 — Deterministic baseline

**Implementation deliverables**
- Implement non-ML statistical/rule baseline first
- Version all thresholds
- Explain each alert from observed features
- Calibrate on synthetic/labelled fixtures

**Required verification**
- golden alerts
- threshold boundary tests
- false-positive regression set

**Definition of Done**
- Baseline alerts are deterministic, explainable and establish a benchmark ML must beat.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 4 — Feature registry

**Implementation deliverables**
- Feature definition/version registry
- Leakage guards and availability timestamps
- Train/serve transformation parity
- Missing-value semantics

**Required verification**
- offline/online parity tests
- leakage tests
- feature version tests

**Definition of Done**
- Every feature has provenance, availability time and identical train/inference transformation code path.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 5 — Isolation Forest service/model registry

**Implementation deliverables**
- Python 3.14 service
- Deterministic training seed/environment manifest
- Model artifact digest and registry
- Inference output with model+feature versions

**Required verification**
- model reproducibility tests
- API contract tests
- resource limit tests

**Definition of Done**
- Inference can be reproduced from model digest, feature registry version and dataset manifest.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 6 — Evaluation/drift/explanations

**Implementation deliverables**
- Holdout/temporal evaluation
- Precision/recall and operational alert-volume metrics
- Drift diagnostics
- Explain anomaly factors without causal claims

**Required verification**
- evaluation reproducibility
- drift fixture tests

**Definition of Done**
- ML promotion requires evidence it beats baseline on predefined metrics without unacceptable alert volume.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 7 — Incident workflow/UI

**Implementation deliverables**
- Triage/status/assignment
- Evidence links back to normalized observations
- RBAC/audit
- Feedback captured separately from labels until reviewed

**Required verification**
- authorization tests
- workflow state tests
- provenance navigation tests

**Definition of Done**
- Analysts can trace every incident signal to raw provenance and model/baseline version.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 8 — Scale/privacy/public v1

**Implementation deliverables**
- Data minimization/retention
- Anonymized synthetic demo dataset
- Load/failure benchmarks
- Signed release/SBOM/model card

**Required verification**
- privacy checks
- ClickHouse loss/rebuild
- clean install

**Definition of Done**
- Public v1 ships without sensitive sample data, documents model limits, and proves derived-store rebuild and target throughput.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Public v1 invariant
The project is not called production-ready merely because all phases are coded. `PUBLIC-V1-GO` requires the repository release gate, clean-install proof, security/recovery evidence and signed/verifiable release artifacts.
