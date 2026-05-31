# Safety Requirements

Consolidated safety requirements for Plant Ark module firmware and Hub software.

## Module-level safety

| ID | Pattern | Requirement |
|----|---------|-------------|
| REQ-SAF-001 | Ubiquitous | The module shall boot with pump off and all valves closed. |
| REQ-SAF-002 | Unwanted | If bus communication timeout exceeds 10 seconds, then the module shall stop the pump and close all valves. |
| REQ-SAF-003 | Unwanted | If the leak sensor is active, then the module shall stop the pump and close all valves. |
| REQ-SAF-004 | Unwanted | If water level is low, then the module shall reject watering commands. |
| REQ-SAF-005 | Ubiquitous | The module shall never open more than one valve simultaneously. |
| REQ-SAF-006 | Ubiquitous | The module shall never run the pump longer than max_duration_ms. |
| REQ-SAF-007 | Ubiquitous | The module shall reject duplicate command_id values. |
| REQ-SAF-M01 | Ubiquitous | The module shall enable a hardware watchdog timer. |
| REQ-SAF-M02 | Unwanted | If a valve fails to open within 2 seconds of command, then the module shall abort watering and report fault. |
| REQ-SAF-M03 | Unwanted | If the pump is commanded on with all valves closed and bypass is unavailable, then the module shall not start the pump. |

## Hub-level safety

| ID | Pattern | Requirement |
|----|---------|-------------|
| REQ-SAF-008 | Ubiquitous | The Hub shall enforce a global watering lock allowing only one active watering command at a time. |
| REQ-SAF-009 | Unwanted | If any module reports leak active, then the Hub shall block all watering globally. |
| REQ-SAF-010 | Unwanted | If reservoir level is low, then the Hub shall block all watering globally. |
| REQ-SAF-011 | Unwanted | If pump current exceeds 1500 mA, then the Hub shall raise pump_fault alert and block watering for that module. |
| REQ-SAF-012 | Unwanted | If watering does not increase moisture after 3 consecutive doses, then the Hub shall raise manual_attention alert. |
| REQ-SAF-H05 | Ubiquitous | The Hub shall enforce daily maxDosesPerDay per plant. |
| REQ-SAF-H06 | State-driven | While quiet hours are active, the Hub shall suppress automated watering unless moisture is critically low. |

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
| Bus timeout | Pump off, valves closed | Module offline alert |
| Leak detected | Pump off, valves closed | Global watering block |
| Reservoir low | Reject water commands | Global watering block |
| Power loss | Pump off (NC valves close) | Module offline on recovery |

## Related documents

- [Electrical safety](electrical-safety.md)
- [Water quality](water-quality.md)
- [Safety interlocks spec](../../specs/005-safety-interlocks/spec.md)
- [Constitution](../../constitution.md)
