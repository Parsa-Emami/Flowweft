# FlowWeft: forty implementation commits

Updated 2026-10-16. Current implementation is the web foundation; core features are not complete.

Full reference workflow: Map synthetic Zeek/CSV -> import duplicate/reordered batch -> verify lineage -> run statistical baseline -> inspect explanation -> export -> recover manifests/partitions after process kill.

**C30: first locally usable supported product**, after actual verified C01-C30 and clean-host workflow/restart/restore. **C40: complete published OSS v1**, after full source/engine release gates and installation of the published version. No paid account, domain or customer-pilot count is required.

| ID | Intended commit | Dependencies | Detailed work card |
|---|---|---|---|
| C01 | `docs(product): freeze the open-source clone-to-value workflow` | None | [Files/resources/tests](commits/C01.md) |
| C02 | `chore(toolchain): lock reproducible open-source resources` | C01 | [Files/resources/tests](commits/C02.md) |
| C03 | `feat(runtime): implement unified local engine setup and launch` | C02 | [Files/resources/tests](commits/C03.md) |
| C04 | `feat(contracts): define typed versioned domain inputs and results` | C03 | [Files/resources/tests](commits/C04.md) |
| C05 | `feat(storage): prove recoverable local authoritative writes` | C04 | [Files/resources/tests](commits/C05.md) |
| C06 | `ci(engine): verify the actual engine from a clean checkout` | C05 | [Files/resources/tests](commits/C06.md) |
| C07 | `feat(import): define csv and zeek schema mapping` | C06 | [Files/resources/tests](commits/C07.md) |
| C08 | `feat(upload): stream bounded private batch uploads` | C07 | [Files/resources/tests](commits/C08.md) |
| C09 | `feat(normalize): normalize addresses time and flow units` | C08 | [Files/resources/tests](commits/C09.md) |
| C10 | `feat(identity): compute stable observed flow identifiers` | C09 | [Files/resources/tests](commits/C10.md) |
| C11 | `feat(quarantine): record invalid row reasons and coverage` | C10 | [Files/resources/tests](commits/C11.md) |
| C12 | `feat(parquet): commit immutable partition manifests` | C11 | [Files/resources/tests](commits/C12.md) |
| C13 | `feat(jobs): checkpoint single writer batch processing` | C12 | [Files/resources/tests](commits/C13.md) |
| C14 | `feat(query): implement bounded duckdb analytical queries` | C13 | [Files/resources/tests](commits/C14.md) |
| C15 | `feat(features): version deterministic feature extraction` | C14 | [Files/resources/tests](commits/C15.md) |
| C16 | `feat(baseline): compute explainable statistical anomalies` | C15 | [Files/resources/tests](commits/C16.md) |
| C17 | `feat(lineage): bind inference to exact source and detector` | C16 | [Files/resources/tests](commits/C17.md) |
| C18 | `feat(labels): record analyst classifications separately` | C17 | [Files/resources/tests](commits/C18.md) |
| C19 | `feat(api): expose private batches summaries and findings` | C18 | [Files/resources/tests](commits/C19.md) |
| C20 | `feat(ui): guide mapping and show batch coverage` | C19 | [Files/resources/tests](commits/C20.md) |
| C21 | `feat(ui): render drilldown baseline explanations` | C20 | [Files/resources/tests](commits/C21.md) |
| C22 | `feat(export): create reproducible report bundles` | C21 | [Files/resources/tests](commits/C22.md) |
| C23 | `feat(privacy): redact addresses with documented join semantics` | C22 | [Files/resources/tests](commits/C23.md) |
| C24 | `feat(retention): expire raw input and derived partitions` | C23 | [Files/resources/tests](commits/C24.md) |
| C25 | `feat(evaluation): add baseline quality and temporal split harness` | C24 | [Files/resources/tests](commits/C25.md) |
| C26 | `test(recovery): exercise partition corruption and disk pressure` | C25 | [Files/resources/tests](commits/C26.md) |
| C27 | `test(security): prove project abuse and authorization boundaries` | C26 | [Files/resources/tests](commits/C27.md) |
| C28 | `perf(local): measure bounded target and overload workloads` | C27 | [Files/resources/tests](commits/C28.md) |
| C29 | `feat(operations): expose real engine readiness and redacted diagnostics` | C28 | [Files/resources/tests](commits/C29.md) |
| C30 | `test(acceptance): prove full local usability from git clone` | C29 | [Files/resources/tests](commits/C30.md) |
| C31 | `build(release): package complete reproducible open-source artifacts` | C30 | [Files/resources/tests](commits/C31.md) |
| C32 | `feat(network): harden local launch and optional private hosting` | C31 | [Files/resources/tests](commits/C32.md) |
| C33 | `test(ux): verify keyboard mobile failures and compatible updates` | C32 | [Files/resources/tests](commits/C33.md) |
| C34 | `docs(oss): complete installation usage contribution and support guides` | C33 | [Files/resources/tests](commits/C34.md) |
| C35 | `test(distribution): verify signed artifacts and data-safe upgrades` | C34 | [Files/resources/tests](commits/C35.md) |
| C36 | `test(onboarding): repeat clone-to-value independently` | C35 | [Files/resources/tests](commits/C36.md) |
| C37 | `fix(acceptance): resolve observed installation and workflow blockers` | C36 | [Files/resources/tests](commits/C37.md) |
| C38 | `docs(release): freeze local privacy limits and maintenance policy` | C37 | [Files/resources/tests](commits/C38.md) |
| C39 | `ci(release): enforce evidence-backed open-source v1 readiness` | C38 | [Files/resources/tests](commits/C39.md) |
| C40 | `chore(release): publish and install the verified open-source v1` | C39 | [Files/resources/tests](commits/C40.md) |

Use `npm run plan -- next` or `npm run plan -- show C07`. These forty work units normally become focused implementation commits; split child IDs only when necessary and keep parent requirement/evidence coverage. Do not create empty quota commits.

C01-C06 establish full engine foundations; C07-C26 implement twenty project-specific capabilities; C27-C30 prove local safety, measured bounds and recovery; C31-C38 finish complete packaging, networking, UX, docs, upgrade, independent onboarding and maintenance; C39-C40 gate and publish real v1 evidence. W01-W08 are a separate historical web track, never proof of C completion.
