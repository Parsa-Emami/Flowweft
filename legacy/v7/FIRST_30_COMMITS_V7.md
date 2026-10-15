# FlowWeft — First 30 Commit Plan v7

These are atomic intent boundaries, not mandatory commit-message text. Do not combine unrelated items merely to hit a number.

1. chore: initialize toolchain manifests and lockfiles
2. ci: make repository validation executable
3. chore: add local development environment/health checks
4. test: add clean-bootstrap smoke test
5. docs: freeze Phase 0 invariants and ADR index
6. phase0: define normalized flow/event schema
7. phase0: stable source/event IDs
8. phase0: timestamp/timezone and clock-quality policy
9. phase0: dataset provenance manifest
10. test(phase0): add schema fixtures
11. docs(phase0): record exit evidence and ADR updates
12. phase1: streaming parsers
13. phase1: malformed record quarantine
14. phase1: idempotent/replayable ingestion
15. phase1: backpressure and batch boundaries
16. test(phase1): add parser fuzz
17. docs(phase1): record exit evidence and ADR updates
18. phase2: partition/order key design from measured query patterns
19. phase2: retention/TTL policy
20. phase2: derived-store rebuild path from raw/normalized evidence
21. phase2: query budget limits
22. test(phase2): add rebuild test
23. docs(phase2): record exit evidence and ADR updates
24. phase3: implement non-ML statistical/rule baseline first
25. phase3: version all thresholds
26. phase3: explain each alert from observed features
27. phase3: calibrate on synthetic/labelled fixtures
28. test(phase3): add golden alerts
29. docs(phase3): record exit evidence and ADR updates
30. test: close Phase 0/1 regression or failure-proof gap before scope expansion
