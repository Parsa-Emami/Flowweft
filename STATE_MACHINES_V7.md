# FlowWeft — State Machines v7

- **Ingest:** `RECEIVED -> VALIDATING -> NORMALIZED -> STORED | QUARANTINED`
- **Model:** `CANDIDATE -> EVALUATED -> ACTIVE -> SHADOW -> RETIRED`
- **Incident:** `OPEN -> TRIAGED -> BENIGN | CONFIRMED -> CLOSED`

Transitions are domain commands with authorization, optimistic version check where applicable, audit event and invariant tests. Illegal transitions fail closed and are observable.
