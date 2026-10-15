# FlowWeft

> v7.0 status: **ARCHITECTURE-GO / BOOTSTRAP-GO / SOURCE-NOT-IMPLEMENTED**

This directory is a standalone GitHub repository starting point for FlowWeft. It contains the frozen architecture/specification, valid HTTP/event/configuration contracts, GitHub governance/security controls, and project-specific source bootstrap commands.

## Runtime boundary
- Laravel 13 control plane/API
- Python 3.14 feature/inference service
- Zeek ingestion pipeline
- ClickHouse telemetry/flows
- PostgreSQL 18.6 authoritative metadata
- Valkey
- S3-compatible object storage
- OpenTelemetry

## First executable proof
Synthetic Zeek/CSV → normalized observed flows → deterministic baseline → inference/provenance → duplicate/reordered input preserves stable IDs.

## Start
```bash
make validate
# verify the GitHub owner/module namespace first
make bootstrap
```

Read `ROADMAP_V7.md`, `PROJECT_START_CHECKLIST_V7.md`, `ACCEPTANCE_GATES_V7.md`, and `GITHUB_REPOSITORY_SETUP_V7.md` before the first code commit.

## Evidence rule
Architecture readiness is not production readiness. “S-tier”, “secure”, “resilient”, or performance claims require executable test/observability/failure/recovery/benchmark/release evidence.

## v7 portfolio position
Recommended implementation order: **3 / 10**. Good early project after deterministic foundations; must resist jumping to ML before ingestion, provenance and baseline correctness are proven.
