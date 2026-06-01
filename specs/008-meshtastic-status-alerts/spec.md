# Feature Spec: Meshtastic Status and Alerts

**Feature ID:** 008-meshtastic-status-alerts  
**Status:** Approved  
**Last updated:** 2026-05-31

## Summary

Optional Meshtastic integration via a separate mesh-bridge service. Publishes periodic status summaries and immediate critical alerts. Not required for normal operation.

## User stories

- As an operator away from home, I want a periodic status summary so that I know the nursery is OK.
- As an operator away from home, I want immediate critical alerts so that I can respond to leaks or faults.

## Requirements (EARS)

### Ubiquitous

- REQ-MESH-001 (Ubiquitous): Meshtastic shall be optional — the Hub shall operate fully without it.
- REQ-MESH-002 (Ubiquitous): The mesh-bridge shall be a separate service from hub-api.
- REQ-MESH-003 (Ubiquitous): Meshtastic shall carry status summaries and critical alerts only — not full sensor history or configuration.

### Event-driven

- REQ-MESH-004 (Event-driven): When a critical alert is created, the mesh-bridge shall publish an alert packet within 60 seconds (deduplicated).
- REQ-MESH-005 (Event-driven): When 30 minutes have elapsed since the last summary, the mesh-bridge shall publish a status summary packet.

### Unwanted behavior

- REQ-MESH-006 (Unwanted): If the same alert type was published within 15 minutes and state has not changed, then the mesh-bridge shall not republish.

### Optional

- REQ-MESH-007 (Optional): Where Meshtastic hardware is not connected, the mesh-bridge shall log payloads to console (software MVP stub).

## Payload formats

Status summary:

```json
{
  "type": "plant_hub_status",
  "status": "ok",
  "plants": 8,
  "needs_water": 2,
  "reservoir": 74,
  "water_temp_c": 18.4,
  "tent_temp_c": 19.1,
  "humidity": 68,
  "leak": false
}
```

Alert:

```json
{
  "type": "plant_hub_alert",
  "severity": "critical",
  "alert": "leak_detected",
  "message": "Leak detected under reservoir tray"
}
```

## Acceptance criteria

| REQ ID | Criterion | Verified by |
|--------|-----------|-------------|
| REQ-MESH-005 | Summary published every 30 min | Scenario: Periodic status summary |
| REQ-MESH-004 | Critical alert published immediately | Scenario: Critical alert published |
| REQ-MESH-007 | Stub logs to console without hardware | Scenario: Stub mode logs payload |
| REQ-MESH-006 | Duplicate alert suppressed | Scenario: Duplicate alert deduplicated |

## Related artifacts

- Gherkin: [meshtastic-status-alerts.feature](meshtastic-status-alerts.feature)
- Sequence: [sequence.md](sequence.md)
- Integration: [meshtastic.md](../../docs/integrations/meshtastic.md)
