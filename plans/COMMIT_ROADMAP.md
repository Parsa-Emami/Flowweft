# FlowWeft — product implementation roadmap

Web application delivery is tracked separately in [WEB_ROADMAP.md](WEB_ROADMAP.md). Engine milestones remain pending unless backed by their own evidence.

## C01 — `docs(product): confirm personal use acceptance and demand hypotheses`

Stage: foundation. Dependencies: None. Requirements: N01.

Deliverables: `docs/product/VALIDATION_LOG.md`.

- Choose one owned real task, identify current workaround and record measured baseline; public demand remains unvalidated.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C01.json.

Evidence: `docs/evidence/C01.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C02 — `chore(toolchain): verify supported versions and lock dependencies`

Stage: foundation. Dependencies: C01. Requirements: N02.

Deliverables: `docs/engineering/toolchain-lock.json`.

- Official support/release URLs and verification date exist for each selected dependency; no future or assumed version pin.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C02.json.

Evidence: `docs/evidence/C02.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C03 — `chore(app): initialize selected minimal runtime`

Stage: foundation. Dependencies: C02. Requirements: N03.

Deliverables: `docs/engineering/BOOTSTRAP_EVIDENCE.md`, `pyproject.toml`, `uv.lock`, `flowweft/__main__.py`, `flowweft/http/app.py`, `package.json`, `package-lock.json`, `apps/web/src/main.tsx`, `docs/engineering/WEB_RUNBOOK.md`.

- Fresh checkout boots minimal CLI or local UI; do not run legacy Laravel/PostgreSQL bootstrap.
- Web entry point is mandatory. W01-W05 supply the tested shell; complete engine obligations before verifying C03.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C03.json.

Evidence: `docs/evidence/C03.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C04 — `feat(contracts): freeze typed local and transport contracts`

Stage: foundation. Dependencies: C03. Requirements: N04.

Deliverables: `contracts/README.md`, `contracts/input.schema.json`, `contracts/result.schema.json`.

- Inputs, errors, output, schema versions, timeout and compatibility behavior are typed with positive/negative fixtures.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C04.json.

Evidence: `docs/evidence/C04.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C05 — `feat(storage): implement minimal authoritative storage adapter`

Stage: foundation. Dependencies: C04. Requirements: N05.

Deliverables: `docs/architecture/STORAGE_PROOF.md`, `flowweft/storage/metadata.py`, `tests/test_storage.py`.

- Authority, atomic write boundary and recovery mechanism match selected profile; storage loss test has actionable result.

Verification: tests/test_storage.py.

Evidence: `docs/evidence/C05.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C06 — `ci(checks): run actual runtime build and foundational tests`

Stage: foundation. Dependencies: C05. Requirements: N06.

Deliverables: `.github/workflows/runtime.yml`.

- Clean-checkout build, formatting and contract/invariant tests pass; plan validation is never reported as application testing.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C06.json.

Evidence: `docs/evidence/C06.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C07 — `feat(import): define csv and zeek schema mapping`

Stage: domain. Dependencies: C06. Requirements: F01.

Deliverables: `flowweft/importers/schema.py`, `tests/test_schema.py`.

- Unknown field meanings and packet-versus-flow mismatch require explicit mapping.

Verification: tests/test_schema.py.

Evidence: `docs/evidence/C07.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C08 — `feat(upload): stream bounded private batch uploads`

Stage: domain. Dependencies: C07. Requirements: F02.

Deliverables: `flowweft/http/upload.py`, `tests/test_upload.py`.

- Size limit and interrupted uploads do not commit a visible batch.

Verification: tests/test_upload.py.

Evidence: `docs/evidence/C08.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C09 — `feat(normalize): normalize addresses time and flow units`

Stage: domain. Dependencies: C08. Requirements: F03.

Deliverables: `flowweft/core/normalize.py`, `tests/test_normalize.py`.

- Original timestamp and units survive; timezone ambiguity remains marked.

Verification: tests/test_normalize.py.

Evidence: `docs/evidence/C09.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C10 — `feat(identity): compute stable observed flow identifiers`

Stage: domain. Dependencies: C09. Requirements: F04.

Deliverables: `flowweft/core/identity.py`, `tests/test_identity.py`.

- Reordered rows and repeated same batch do not double count observations.

Verification: tests/test_identity.py.

Evidence: `docs/evidence/C10.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C11 — `feat(quarantine): record invalid row reasons and coverage`

Stage: domain. Dependencies: C10. Requirements: F05.

Deliverables: `flowweft/core/quarantine.py`, `tests/test_quarantine.py`.

- Report states rejected-row fraction and cannot present partial input as full coverage.

Verification: tests/test_quarantine.py.

Evidence: `docs/evidence/C11.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C12 — `feat(parquet): commit immutable partition manifests`

Stage: domain. Dependencies: C11. Requirements: F06.

Deliverables: `flowweft/storage/parquet.py`, `tests/test_partition_commit.py`.

- Manifest becomes visible only after files durable; orphan temp files are cleaned on restart.

Verification: tests/test_partition_commit.py.

Evidence: `docs/evidence/C12.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C13 — `feat(jobs): checkpoint single writer batch processing`

Stage: domain. Dependencies: C12. Requirements: F07.

Deliverables: `flowweft/jobs/worker.py`, `tests/test_jobs.py`.

- Crash resumes from safe checkpoint with same final partition hashes.

Verification: tests/test_jobs.py.

Evidence: `docs/evidence/C13.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C14 — `feat(query): implement bounded duckdb analytical queries`

Stage: domain. Dependencies: C13. Requirements: F08.

Deliverables: `flowweft/analytics/query.py`, `tests/test_query.py`.

- Only allowlisted query shapes run with memory/time limits and cancellation.

Verification: tests/test_query.py.

Evidence: `docs/evidence/C14.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C15 — `feat(features): version deterministic feature extraction`

Stage: domain. Dependencies: C14. Requirements: F09.

Deliverables: `flowweft/features/extract.py`, `tests/test_features.py`.

- Identical partition and schema produce identical feature table.

Verification: tests/test_features.py.

Evidence: `docs/evidence/C15.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C16 — `feat(baseline): compute explainable statistical anomalies`

Stage: domain. Dependencies: C15. Requirements: F10.

Deliverables: `flowweft/detectors/baseline.py`, `tests/test_baseline.py`.

- Every anomaly includes threshold, baseline window and observed measurement.

Verification: tests/test_baseline.py.

Evidence: `docs/evidence/C16.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C17 — `feat(lineage): bind inference to exact source and detector`

Stage: domain. Dependencies: C16. Requirements: F11.

Deliverables: `flowweft/core/lineage.py`, `tests/test_lineage.py`.

- Missing or mismatched feature schema prevents inference.

Verification: tests/test_lineage.py.

Evidence: `docs/evidence/C17.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C18 — `feat(labels): record analyst classifications separately`

Stage: domain. Dependencies: C17. Requirements: F12.

Deliverables: `flowweft/labels/service.py`, `tests/test_labels.py`.

- Analyst label cannot mutate flow observations or train/test split metadata.

Verification: tests/test_labels.py.

Evidence: `docs/evidence/C18.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C19 — `feat(api): expose private batches summaries and findings`

Stage: domain. Dependencies: C18. Requirements: F13.

Deliverables: `flowweft/http/api.py`, `tests/test_api.py`.

- Pagination and object authorization work; raw SQL and arbitrary paths are not accepted.

Verification: tests/test_api.py.

Evidence: `docs/evidence/C19.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C20 — `feat(ui): guide mapping and show batch coverage`

Stage: domain. Dependencies: C19. Requirements: F14.

Deliverables: `apps/web/src/pages/Imports.tsx`, `apps/web/tests/imports.spec.ts`.

- User sees units, rejected rows, data age and mapping preview before processing.

Verification: apps/web/tests/imports.spec.ts.

Evidence: `docs/evidence/C20.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C21 — `feat(ui): render drilldown baseline explanations`

Stage: domain. Dependencies: C20. Requirements: F15.

Deliverables: `apps/web/src/pages/Flows.tsx`, `apps/web/tests/flows.spec.ts`.

- Anomaly and confirmed attack labels remain distinct in charts and tables.

Verification: apps/web/tests/flows.spec.ts.

Evidence: `docs/evidence/C21.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C22 — `feat(export): create reproducible report bundles`

Stage: domain. Dependencies: C21. Requirements: F16.

Deliverables: `flowweft/export/bundle.py`, `tests/test_export.py`.

- Bundle includes source hashes, mappings, schema, detector version and limitations.

Verification: tests/test_export.py.

Evidence: `docs/evidence/C22.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C23 — `feat(privacy): redact addresses with documented join semantics`

Stage: domain. Dependencies: C22. Requirements: F17.

Deliverables: `flowweft/privacy/redact.py`, `tests/test_privacy.py`.

- Export supports pseudonymous stable joins with secret mapping excluded.

Verification: tests/test_privacy.py.

Evidence: `docs/evidence/C23.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C24 — `feat(retention): expire raw input and derived partitions`

Stage: domain. Dependencies: C23. Requirements: F18.

Deliverables: `flowweft/storage/retention.py`, `tests/test_retention.py`.

- Retention cannot leave dangling manifests; delete outcome is auditable.

Verification: tests/test_retention.py.

Evidence: `docs/evidence/C24.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C25 — `feat(evaluation): add baseline quality and temporal split harness`

Stage: domain. Dependencies: C24. Requirements: F19.

Deliverables: `benchmarks/evaluate.py`, `tests/test_temporal_split.py`.

- Held-out time/session groups avoid leakage; quality report states class counts and data limitations.

Verification: benchmarks/evaluate.py; tests/test_temporal_split.py.

Evidence: `docs/evidence/C25.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C26 — `test(recovery): exercise partition corruption and disk pressure`

Stage: domain. Dependencies: C25. Requirements: F20.

Deliverables: `tests/test_recovery.py`, `docs/evidence/batch-template.md`.

- Corrupt partition, full disk and process kill do not yield silently successful analysis.

Verification: tests/test_recovery.py.

Evidence: `docs/evidence/C26.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C27 — `test(security): close abuse and authorization release gaps`

Stage: private-release. Dependencies: C26. Requirements: N27.

Deliverables: `tests/release/security-matrix.md`.

- Run project-specific negative UAT plus XSS/import/auth checks for enabled surfaces; document unsupported attack surface and unresolved findings.

Verification: tests/release/security-matrix.md.

Evidence: `docs/evidence/C27.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C28 — `perf(budgets): measure target workload and overload behavior`

Stage: private-release. Dependencies: C27. Requirements: N28.

Deliverables: `docs/evidence/performance.json`.

- Record hardware, OS, source digest, workload, p50/p95/p99 where meaningful, CPU, RSS, storage growth, cancellation and saturation; lower supported limits if targets fail.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C28.json.

Evidence: `docs/evidence/C28.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C29 — `feat(operations): expose health diagnostics and bounded logs`

Stage: private-release. Dependencies: C28. Requirements: N29.

Deliverables: `ops/diagnostics.md`.

- Local health/status path identifies storage/job/provider failure; sensitive content is absent from synthetic log sentinel test.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C29.json.

Evidence: `docs/evidence/C29.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C30 — `test(recovery): prove personal backup restore and private install`

Stage: private-release. Dependencies: C29. Requirements: N30.

Deliverables: `docs/evidence/private-install.json`.

- Fresh machine/browser install and restore completes project UAT; personal deployment remains private until its relevant safety gates pass.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C30.json.

Evidence: `docs/evidence/C30.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C31 — `build(packaging): create versioned installable artifacts`

Stage: public-release. Dependencies: C30. Requirements: N31.

Deliverables: `scripts/package.sh`, `docs/release/ARTIFACTS.md`, `ops/web/nginx.conf.template`, `ops/web/service.systemd`, `docs/engineering/WEB_RUNBOOK.md`.

- Static/CLI/container artifact matches chosen distribution; SBOM, licenses, checksums and provenance truthfully reflect what is built.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C31.json.

Evidence: `docs/evidence/C31.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C32 — `feat(web): configure domain tls and isolated public demo`

Stage: public-release. Dependencies: C31. Requirements: N32.

Deliverables: `infra/deployment.md`, `docs/evidence/domain.json`.

- Domain/HTTPS/cookies/CSP and private-origin policy are checked; public demo contains synthetic data only and dangerous runtime features are disabled.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C32.json.

Evidence: `docs/evidence/C32.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C33 — `test(ux): verify accessibility mobile and update behavior`

Stage: public-release. Dependencies: C32. Requirements: N33.

Deliverables: `docs/evidence/ux.json`.

- Keyboard/table alternative, 360px through 1440px layouts, empty/error/offline states and N-1 data upgrade fixtures work on documented supported platforms.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C33.json.

Evidence: `docs/evidence/C33.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C34 — `docs(release): publish english usage limits and support contract`

Stage: public-release. Dependencies: C33. Requirements: N34.

Deliverables: `docs/release/USER_GUIDE.md`, `SECURITY.md`.

- New user completes one documented task; English install/use/privacy/limits/support pages include owner contact supplied by maintainer and actual evidence links.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C34.json.

Evidence: `docs/evidence/C34.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C35 — `test(release): exercise signed artifact and clean upgrade paths`

Stage: public-release. Dependencies: C34. Requirements: N35.

Deliverables: `docs/evidence/release-verification.json`.

- Install artifact from clean environment; verify signer with independently trusted key/identity; supported upgrade and rollback preserve latest valid data.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C35.json.

Evidence: `docs/evidence/C35.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C36 — `docs(beta): record independent pilot feedback and beta gate`

Stage: public-release. Dependencies: C35. Requirements: N36.

Deliverables: `docs/product/PILOT_RESULTS.md`.

- Target: 5 relevant trials, 3 complete core task and 2 return for real repeat use; if unavailable continue personal release and mark demand unvalidated rather than inventing pilots.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C36.json.

Evidence: `docs/evidence/C36.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C37 — `fix(beta): resolve evidence backed pilot blockers`

Stage: public-release. Dependencies: C36. Requirements: N37.

Deliverables: `docs/product/BETA_FIXES.md`.

- Fix observed failures, re-run affected checks, record remaining limitations; if no pilots, use observed personal UAT issues and retain unvalidated market label.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C37.json.

Evidence: `docs/evidence/C37.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C38 — `docs(service): freeze retention portability quotas and support policy`

Stage: public-release. Dependencies: C37. Requirements: N38.

Deliverables: `docs/release/SERVICE_POLICY.md`.

- For public service state data location, deletion/export rules, quotas, expected support and outage behavior; paid billing and SLA are not enabled without separate ADR.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C38.json.

Evidence: `docs/evidence/C38.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C39 — `ci(release): verify v1 gate from clean source tree`

Stage: public-release. Dependencies: C38. Requirements: N39.

Deliverables: `docs/evidence/v1-gate.json`.

- Every mandatory requirement has actual passed evidence; no critical open security/recovery issue; release profile and demand status are explicit.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C39.json.

Evidence: `docs/evidence/C39.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.

## C40 — `chore(release): publish v1 artifacts and monitor first use`

Stage: public-release. Dependencies: C39. Requirements: N40.

Deliverables: `docs/evidence/launch.json`, `plans/progress.json`.

- Release only verified profile artifacts, run installed smoke test, record actual version/source digest and follow up support/rollback; never publish fabricated claims.

Verification: Run the actual project checks relevant to this task and record results in docs/evidence/C40.json.

Evidence: `docs/evidence/C40.json`.

Rollback: Before release: revert isolated code change with tests. For persisted data: preserve exports/backup and last compatible reader; use forward repair after new writes. Do not restore a stale snapshot over newer data.
