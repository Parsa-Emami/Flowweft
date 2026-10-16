# FlowWeft product requirements v0

Status: planning; application source not implemented. English-facing app/docs are the release default. See Persian assessment for commercial hypotheses.

Target user: تحلیلگر مستقل، تیم شبکهٔ کوچک و پژوهشگر امنیت

Job to complete: گزارش قابل‌بازتولید از رفتار جریان و anomaly با حدود اعتبار

Differentiation hypothesis: تحلیل offline/private batch با lineage و baseline روشن، بدون SIEM سنگین

## MVP acceptance scope

- CSV و Zeek conn.log با schema mapping
- Parquet partition + DuckDB embedded
- baseline آماری قابل‌توضیح
- داشبورد خصوصی و export گزارش

## Excluded until another decision

- live packet capture روی سرور عمومی
- ClickHouse streaming cluster
- مدل ML production
- IDS/NDR سازمانی real-time

## End-to-end outcomes

1. CSV fixture و Zeek را normalize کن و mapping نامعتبر را quarantine کن
2. duplicate/reordered batch شناسه‌های برابر و بدون double count بدهد
3. report از همان partition و feature schema دوباره تولید شود؛ anomaly explanation حاضر باشد

Functional requirements F01–F20 and nonfunctional/release requirements are mapped one-to-one in `plans/requirements.json`. Tests belong with their feature commit, not postponed until launch. Success: a clean installed selected profile performs the core task and recovers from documented failures. Public demand remains unvalidated until real trials are recorded.

## UI flow

Select/import scoped input -> validate limits and permission -> show actual processing state -> explain result and confidence -> review/triage where appropriate -> export -> recover in clean environment. Loading, empty, stale, partial, unauthorized, rejected input, timeout/cancel and permanent failure are explicit. Provide table/keyboard alternatives to canvas, charts and graph paths. No sensitive content in page telemetry.
