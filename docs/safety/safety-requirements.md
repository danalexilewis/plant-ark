# Safety Requirements

Consolidated safety requirements for Plant Ark module firmware and Hub software.

## Requirement ID scheme

Plant Ark uses **two linked ID layers**:

| Layer | ID pattern | Purpose | Authoritative in |
|-------|------------|---------|------------------|
| **Principles** | `REQ-SAF-M##`, `REQ-SAF-H##`, `REQ-SAF-E##`, `REQ-WQ-##` | Non-negotiable constitution rules | [constitution.md](../../constitution.md) |
| **Feature specs** | `REQ-SAF-0NN` | Testable implementation requirements | [specs/005-safety-interlocks/spec.md](../../specs/005-safety-interlocks/spec.md) |
| **Extended** | `REQ-SAF-M08+`, `REQ-SAF-H05+` | Additional safety beyond constitution minimum | This document |

Every constitution safety ID maps to exactly one feature-spec ID (see crosswalk below). Extended IDs (`M08`–`M10`, `H05`–`H06`, `E04`–`E07`, `WQ05`–`WQ11`) expand on constitution principles but do not replace them.

## Constitution crosswalk

### Module-level

| Constitution ID | Feature spec ID | Requirement summary |
|-----------------|-----------------|---------------------|
| REQ-SAF-M01 | REQ-SAF-001 | Boot with pump off and all valves closed |
| REQ-SAF-M02 | REQ-SAF-002 | Bus timeout → stop pump, close valves (10 s limit) |
| REQ-SAF-M03 | REQ-SAF-003 | Leak active → stop pump, close valves |
| REQ-SAF-M04 | REQ-SAF-004 | Low water level → reject watering commands |
| REQ-SAF-M05 | REQ-SAF-005 | Never open more than one valve at a time |
| REQ-SAF-M06 | REQ-SAF-006 | Never run pump longer than `max_duration_ms` |
| REQ-SAF-M07 | REQ-SAF-007 | Reject duplicate `command_id` values |

### Hub-level

| Constitution ID | Feature spec ID | Requirement summary |
|-----------------|-----------------|---------------------|
| REQ-SAF-H01 | REQ-SAF-008 | Global watering lock — one active command at a time |
| REQ-SAF-H02 | REQ-SAF-009 | Any leak → block all watering globally |
| REQ-SAF-H03 | REQ-SAF-010 | Low reservoir → block all watering globally |
| REQ-SAF-H04 | REQ-MAN-005, REQ-DIS-010 | Offline module → block watering for that module's channels |

### Electrical (constitution + extended)

| ID | Source | Requirement summary |
|----|--------|---------------------|
| REQ-SAF-E01 | Constitution | Modules operate on low-voltage DC (24V bus) only |
| REQ-SAF-E02 | Constitution | Mains AC shall not enter tray, tent, or module wet zones |
| REQ-SAF-E03 | Constitution | Grow light and fan via certified smart plugs or enclosed relays |
| REQ-SAF-E04 | [electrical-safety.md](electrical-safety.md) | 24V PSU shall be certified (UL/CE/GS) |
| REQ-SAF-E05 | [electrical-safety.md](electrical-safety.md) | PlantBus connectors labelled "NOT ETHERNET" |
| REQ-SAF-E06 | [electrical-safety.md](electrical-safety.md) | No exposed mains terminals in cart/tent during normal operation |
| REQ-SAF-E07 | [electrical-safety.md](electrical-safety.md) | Hub mounted in dry under-tray zone |

### Water quality (constitution + extended)

| ID | Source | Requirement summary |
|----|--------|---------------------|
| REQ-WQ-01 | Constitution | Opaque reservoir tray |
| REQ-WQ-02 | Constitution | Filter via coarse screen, sponge prefilter, inline mesh |
| REQ-WQ-03 | Constitution | Monitor water temperature and reservoir level |
| REQ-WQ-04 | Constitution | No ozone in v1 |
| REQ-WQ-05–11 | [water-quality.md](water-quality.md) | Extended water-quality and maintenance requirements |

## Module-level safety (feature spec)

| ID | Pattern | Requirement |
|----|---------|-------------|
| REQ-SAF-001 | Ubiquitous | The module shall boot with pump off and all valves closed. |
| REQ-SAF-002 | Unwanted | If bus communication timeout exceeds 10 seconds, then the module shall stop the pump and close all valves. |
| REQ-SAF-003 | Unwanted | If the leak sensor is active, then the module shall stop the pump and close all valves. |
| REQ-SAF-004 | Unwanted | If water level is low, then the module shall reject watering commands. |
| REQ-SAF-005 | Ubiquitous | The module shall never open more than one valve simultaneously. |
| REQ-SAF-006 | Ubiquitous | The module shall never run the pump longer than max_duration_ms. |
| REQ-SAF-007 | Ubiquitous | The module shall reject duplicate command_id values. |

## Extended module safety

| ID | Pattern | Requirement |
|----|---------|-------------|
| REQ-SAF-M08 | Ubiquitous | The module shall enable a hardware watchdog timer. |
| REQ-SAF-M09 | Unwanted | If a valve fails to open within 2 seconds of command, then the module shall abort watering and report fault. |
| REQ-SAF-M10 | Unwanted | If the pump is commanded on with all valves closed and bypass is unavailable, then the module shall not start the pump. |

## Hub-level safety (feature spec)

| ID | Pattern | Requirement |
|----|---------|-------------|
| REQ-SAF-008 | Ubiquitous | The Hub shall enforce a global watering lock allowing only one active watering command at a time. |
| REQ-SAF-009 | Unwanted | If any module reports leak active, then the Hub shall block all watering globally. |
| REQ-SAF-010 | Unwanted | If reservoir level is low, then the Hub shall block all watering globally. |
| REQ-SAF-011 | Unwanted | If pump current exceeds 1500 mA, then the Hub shall raise pump_fault alert and block watering for that module. |
| REQ-SAF-012 | Unwanted | If watering does not increase moisture after 3 consecutive doses, then the Hub shall raise manual_attention alert. |

## Extended hub safety

| ID | Pattern | Requirement |
|----|---------|-------------|
| REQ-SAF-H05 | Ubiquitous | The Hub shall enforce daily maxDosesPerDay per plant. |
| REQ-SAF-H06 | State-driven | While quiet hours are active, the Hub shall suppress automated watering unless moisture is critically low (below `targetMoistureMin - 0.10`). |

## Watering control sequence (safe)

1. Check module online
2. Check water level OK
3. Check no leak/overflow
4. Acquire global watering lock
5. Open selected valve
6. Start pump
7. Run for calibrated duration (≤ max_duration_ms)
8. Stop pump
9. Close selected valve
10. Release global watering lock
11. Optional short flush/bypass cycle
12. Log event
13. Re-measure soil after soak delay

Only one plant/channel waters at a time by default.

## Fail-safe states

| Condition | Module state | Hub state |
|-----------|--------------|-----------|
| Power on | Pump off, valves closed | Normal |
| Bus timeout | Pump off, valves closed | Module offline (90 s); alert at 5 min |
| Leak detected | Pump off, valves closed | Global watering block |
| Reservoir low | Reject water commands | Global watering block |
| Power loss | Pump off (NC valves close) | Module offline on recovery |

## Related documents

- [Electrical safety](electrical-safety.md)
- [Water quality](water-quality.md)
- [Timing and alerting reference](../references/timing-and-alerting.md)
- [Safety interlocks spec](../../specs/005-safety-interlocks/spec.md)
- [Constitution](../../constitution.md)
