# FlowWeft — Final Engine Decisions v7

These are accepted v1 decisions, not open blockers. Alternatives require a future ADR and must preserve public/domain contracts.

1. v1 collection is passive. Zeek logs and normalized flow CSV are primary inputs; raw PCAP parsing is delegated to mature capture/parsing tools rather than custom packet parsers.
2. Every record is explicitly Observed, Derived, Inferred or Analyst-authored. Inference is never stored as observed fact.
3. ClickHouse is the telemetry/time-series analytical store; PostgreSQL owns projects, schemas, model registry, incidents and analyst decisions.
4. TelemetryEnvelope v1 has schema_id/version, source, event_time, ingest_time, provenance, privacy labels and deterministic event identity.
5. First detector is a deterministic robust statistical baseline. First ML detector is Isolation Forest, versioned behind DetectorProvider; supervised XGBoost requires separately approved labeled data.
6. FeatureSchema v1 is immutable. Models bind to exact feature schema, training-data fingerprint, code version, threshold and evaluation report.
7. CI uses synthetic/generated datasets only. External datasets require license/privacy/redistribution review before repository inclusion.
8. Evaluation uses time-aware splits where chronology exists, duplicate/leakage checks, per-scenario metrics, calibration/threshold documentation and drift monitoring.
9. Explainability distinguishes exact deterministic drivers from model explanation approximations; the UI labels confidence/provenance.
