# FlowWeft — Component Architecture v7

## Runtime/components
- Laravel 13 control plane
- Python feature/inference service
- Zeek import pipeline
- ClickHouse telemetry store
- PostgreSQL 18 control/model registry
- Valkey
- S3/SeaweedFS raw input
- OpenTelemetry

## Dependency direction
`Web/CLI -> HTTP/Application -> Domain <- Ports <- Infrastructure Adapters`

Specialized workers/engines consume versioned commands/contracts; they do not reach into Laravel tables except through explicit repositories or service APIs owned by the responsible module.

## Cross-cutting
Transactional outbox, idempotent jobs, correlation IDs, OpenTelemetry, structured audit, rate/resource limits, health/readiness and graceful shutdown are mandatory.
