# ADR 0001 — FlowWeft reference decision

**Status:** Accepted for v1

## Decision
v1 collection is passive. Zeek logs and normalized flow CSV are primary inputs; raw PCAP parsing is delegated to mature capture/parsing tools rather than custom packet parsers.

## Consequences
Implementation and tests must preserve this boundary. An alternative is allowed only through the relevant port/adapter when it preserves authority, public contracts, security invariants and migration semantics.

## Revisit trigger
Measured benchmark, security evidence, maintenance/licensing change or operational incident demonstrates the reference choice no longer satisfies the declared workload/threat model. Revisit via a new superseding ADR; never silently rewrite history.
