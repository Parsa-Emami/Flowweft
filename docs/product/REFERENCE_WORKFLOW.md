# FlowWeft: reference workflow

Status: planned domain acceptance; the current JSON structure preview does not implement this workflow.

Map synthetic Zeek/CSV -> import duplicate/reordered batch -> verify lineage -> run statistical baseline -> inspect explanation -> export -> recover manifests/partitions after process kill.

Required invariants:

- Observed flows separate from inference
- Feature schema and input provenance bound
- No duplicate counting and no train/test temporal leakage

Required UAT:

- CSV fixture و Zeek را normalize کن و mapping نامعتبر را quarantine کن
- duplicate/reordered batch شناسه‌های برابر و بدون double count بدهد
- report از همان partition و feature schema دوباره تولید شود؛ anomaly explanation حاضر باشد

Machine contract: tests/scenarios/clone-to-value.json. C01/C04 create and freeze the actual synthetic positive/negative fixture formats; no real secrets, user source/traffic/case data or unlicensed corpus. A clean source clone must reproduce the entire workflow with restart and restore at C30.
