# Non-Functional Requirements

Measurable quality attributes for Plant Ark v1. Feature specs cover functional behaviour; this document covers how well the system must perform.

## Setup and usability

| ID | Requirement | Target | Verification |
|----|-------------|--------|--------------|
| NFR-SETUP-001 | First-run commissioning (empty cart → first manual water) | ≤ 90 min for a first-time user following the guide | Timed user test |
| NFR-SETUP-002 | Hub software setup (clone → simulator running) | ≤ 4 h for a developer new to the repo | Onboarding timed test |
| NFR-LEARN-001 | Operator can find system status and needs-water list without documentation | ≤ 2 min after opening dashboard | Usability test |
| NFR-LEARN-002 | Error messages state cause and suggested action | 100 % of blocking errors in Gherkin include actionable text | Spec review |

## Reliability and availability

| ID | Requirement | Target | Verification |
|----|-------------|--------|--------------|
| NFR-REL-001 | Hub restart shall not leave modules in unsafe state | Modules enforce safe state independently (REQ-SAF-001, 002) | HW MVP test |
| NFR-REL-002 | Hub restart shall restore assignments and schedules from SQLite | 100 % persistence after clean shutdown | Integration test |
| NFR-REL-003 | Automation shall resume within one evaluation cycle after Hub restart | ≤ 15 min | Integration test |
| NFR-REL-004 | Core watering shall work with Hub offline from internet | 100 % — no WAN required | Design review |

## Performance

| ID | Requirement | Target | Verification |
|----|-------------|--------|--------------|
| NFR-PERF-001 | Dashboard initial load on local network | ≤ 3 s on mid-range phone | Manual / Lighthouse |
| NFR-PERF-002 | WebSocket sensor refresh | ≤ 5 s (REQ-DSH-009) | Integration test |
| NFR-PERF-003 | Manual water command to module actuation | ≤ 2 s under normal bus load | Bench test |

## Security and privacy

| ID | Requirement | Target | Verification |
|----|-------------|--------|--------------|
| NFR-SEC-001 | No telemetry sent to third parties in Core tier | 0 external calls in default config | Network capture |
| NFR-SEC-002 | Hub UI accessible only on local network by default | No port forwarding required | Deployment review |
| NFR-SEC-003 | Optional UI login for shared households | v1.5 — document as future NFR | Roadmap |

## Accessibility

| ID | Requirement | Target | Verification |
|----|-------------|--------|--------------|
| NFR-A11Y-001 | Touch targets on primary actions | ≥ 44 px (dashboard Gherkin) | UI review |
| NFR-A11Y-002 | Status indicators not colour-only | Icon + text for ok/warning/critical | UI review |
| NFR-A11Y-003 | Sufficient contrast for dashboard text | WCAG 2.1 AA for body text | Contrast check |

## Maintainability

| ID | Requirement | Target | Verification |
|----|-------------|--------|--------------|
| NFR-MAINT-001 | Filter sponge rinse | ≤ 5 min weekly | User journey |
| NFR-MAINT-002 | Pump/filter cassette removal | ≤ 30 s without tools | HW acceptance |
| NFR-MAINT-003 | Reservoir drain and refill | ≤ 15 min monthly | User journey |

## Operating envelope

| ID | Requirement | Target |
|----|-------------|--------|
| NFR-ENV-001 | Indoor ambient temperature for Hub electronics | 10–35 °C |
| NFR-ENV-002 | Tent temperature operating range with alerts | 12–30 °C (REQ-ENV-003, 004) |
| NFR-ENV-003 | Tent humidity operating range with alerts | 40–85 % RH (REQ-ENV-009, 010) |
| NFR-ENV-004 | Hub acoustic noise at 1 m | ≤ 35 dBA (fanless Hub; pump runs intermittently) |

## Related documents

- [Success metrics](success-metrics.md)
- [Timing and alerting reference](../docs/references/timing-and-alerting.md)
- [Safety requirements](../docs/safety/safety-requirements.md)
