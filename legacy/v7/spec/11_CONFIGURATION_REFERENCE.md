# FlowWeft — Configuration Reference v1

Canonical machine-readable source: `../contracts/config.schema.json`. Safe local template: `../.env.example`.

| Variable | Requirement | Rule |
|---|---|---|
| `APP_ENV` | required | Non-secret runtime setting; see schema for constraints. |
| `SERVICE_NAME` | required | Non-secret runtime setting; see schema for constraints. |
| `DATABASE_DSN_REF` | required | Secret/reference URI; never embed production credentials in config. |
| `VALKEY_DSN_REF` | required | Secret/reference URI; never embed production credentials in config. |
| `OTEL_EXPORTER_OTLP_ENDPOINT` | required | Non-secret runtime setting; see schema for constraints. |
| `LOG_LEVEL` | optional | Non-secret runtime setting; see schema for constraints. |
| `CLICKHOUSE_DSN_REF` | optional | Secret/reference URI. Do not commit secret material. |
| `OBJECT_STORE_ENDPOINT` | optional | Non-secret runtime setting; see schema for constraints. |
| `OBJECT_STORE_BUCKET` | optional | Non-secret runtime setting; see schema for constraints. |
| `INGEST_MAX_BATCH_ROWS` | optional | Non-secret runtime setting; see schema for constraints. |
| `INFERENCE_MAX_WINDOW_ROWS` | optional | Non-secret runtime setting; see schema for constraints. |
| `MODEL_ARTIFACT_DIGEST_REQUIRED` | optional | Non-secret runtime setting; see schema for constraints. |

Production secrets must be indirect references or injected by the deployment secret store. `.env` is gitignored; `.env.example` contains no live credential. Unknown configuration keys are rejected by the JSON Schema.
