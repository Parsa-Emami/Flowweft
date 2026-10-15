# FlowWeft — Data Ownership v7

- **ClickHouse:** observed/derived/inferred telemetry
- **PostgreSQL:** schemas/models/incidents/analyst labels
- **ObjectStore:** raw uploads/dataset manifests/model artifacts
- **Valkey:** jobs/cache only

## Universal rules
- cache is never authority
- derived projections have checkpoint + rebuild + staleness metric
- secrets/evidence follow project-specific retention and redaction
- deletion does not rewrite immutable audit/custody history
