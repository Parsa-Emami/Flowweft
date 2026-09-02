# FlowWeft — Dependency Policy v7

## Reference dependencies
- zeek
- clickhouse
- python scikit-learn
- postgresql
- valkey
- opentelemetry

All dependencies require exact source/license/security tracking. Vendor-specific libraries stay in Infrastructure adapters. Scanner/rule/model outputs are normalized before entering Domain. Third-party Actions/images are SHA/digest pinned in release paths.
