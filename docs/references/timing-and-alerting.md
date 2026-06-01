# Timing and Alerting Reference

Canonical timing values for Plant Ark Hub and module behaviour. When feature specs disagree, this document is authoritative.

## Module connectivity

| Event | Threshold | Requirement ID | Notes |
|-------|-----------|----------------|-------|
| Module status → offline | 90 s without HEARTBEAT | REQ-DIS-010 | UI and automation treat module as unavailable |
| module_offline alert raised | 5 min continuous offline | REQ-ALT-003 | Alert only — status already offline at 90 s |
| Bus communication timeout (module firmware) | 10 s | REQ-SAF-002 | Module enters safe state independently of Hub |
| Automation skips offline channel | Immediate when status is offline | REQ-AUT-006, REQ-AUT-007 | Does **not** create alert — ALT-003 handles alerting at 5 min |

## Automation loop

| Event | Threshold | Requirement ID |
|-------|-----------|----------------|
| Channel evaluation interval | Every 15 min minimum | REQ-AUT-008 |
| Soak wait before re-evaluation | `soakWaitMinutes` per plant profile | REQ-AUT-002 |
| Quiet hours critical override | moisture below `targetMoistureMin - 0.10` | REQ-AUT-004, REQ-SAF-H06 |
| Daily dose limit reset | Calendar day (Hub local timezone) | REQ-AUT-005 |

## Alerts and deduplication

| Event | Threshold | Requirement ID |
|-------|-----------|----------------|
| Duplicate alert suppression | Same type + source within 15 min | REQ-ALT-009 |
| Filter maintenance reminder | 30 days since last filter service | REQ-ALT-006 |
| Reservoir change reminder | 21 days since last reservoir change | REQ-ALT-010 |
| Pump fault current threshold | 1500 mA | REQ-SAF-011, REQ-ALT-004 |
| Water too warm | > 25 °C | REQ-ALT-005 |
| Moisture stall (no improvement) | 3 consecutive doses | REQ-SAF-012 |

## Environment sensing

| Event | Threshold | Requirement ID |
|-------|-----------|----------------|
| Sensor ingest interval | Every 60 s minimum | REQ-ENV-006 |
| Temperature low alert | < 12 °C | REQ-ENV-003 |
| Temperature high alert | > 30 °C | REQ-ENV-004 |
| Humidity low alert | < 40 % RH | REQ-ENV-009 |
| Humidity high alert | > 85 % RH | REQ-ENV-010 |

## Meshtastic (optional)

| Event | Threshold | Requirement ID |
|-------|-----------|----------------|
| Status summary publish | Every 30 min | REQ-MESH-005 |
| Critical alert publish | Within 60 s of alert creation | REQ-MESH-004 |
| Mesh alert deduplication | Same type within 15 min | REQ-MESH-006 |

## Dashboard

| Event | Threshold | Requirement ID |
|-------|-----------|----------------|
| WebSocket card refresh | Within 5 s of sensor update | REQ-DSH-009 |

## System status aggregation

Used by REQ-DSH-001. Evaluated whenever dashboard loads or alerts change:

| Status | Condition |
|--------|-----------|
| **critical** | Any unacknowledged critical alert (leak, pump_fault) OR any module reporting leak active |
| **warning** | Any unacknowledged warning alert OR any module offline OR reservoir low OR needs-water count > 0 |
| **ok** | None of the above |

## Related documents

- [Safety requirements](../safety/safety-requirements.md)
- [Alerts and maintenance spec](../../specs/006-alerts-maintenance/spec.md)
- [Dashboard monitoring spec](../../specs/009-dashboard-monitoring/spec.md)
