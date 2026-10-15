# FlowWeft — Final Implementation Specification

This specification freezes the v1 implementation contract. Changes that violate an invariant, authority boundary or public contract require an ADR/RFC and migration/compatibility plan.

## Domain objects
- `DataSource`
- `IngestBatch`
- `ObservedFlow`
- `FeatureSchema`
- `FeatureVector`
- `Detector`
- `ModelVersion`
- `Inference`
- `Incident`
- `AnalystLabel`
- `EvaluationRun`
- `DriftReport`

## Aggregate rules
- Aggregate mutations occur through application commands, never controller/model convenience writes.
- Aggregate version is checked on conflicting writes.
- Invariants are tested with illegal-transition/negative cases.
- Domain objects do not import Laravel/Eloquent/vendor SDKs.

## Frozen v1 invariants
1. Observed data is immutable provenance; correction is new record/version, not hidden rewrite.
2. Feature vector is bound to immutable FeatureSchema version.
3. Model version binds artifact digest, training/evaluation data fingerprint, code revision and threshold.
4. Approximate explanations are labeled approximate.
5. No active scanning or packet injection in v1.
