# Feature Spec: Dashboard Monitoring

**Feature ID:** 009-dashboard-monitoring  
**Status:** Approved  
**Last updated:** 2026-05-31

## Summary

The local web UI dashboard provides a mobile-friendly overview of system status, modules, plants, recent events, and active alerts.

## User stories

- As an operator, I want a single dashboard view so that I can see the whole nursery at a glance.
- As an operator, I want to use the UI on my phone so that I can check the nursery from anywhere on my home network.

## Requirements (EARS)

### Ubiquitous

- REQ-DSH-001 (Ubiquitous): The dashboard shall display system status (ok, warning, critical) computed per [timing and alerting reference](../../docs/references/timing-and-alerting.md#system-status-aggregation).
- REQ-DSH-002 (Ubiquitous): The dashboard shall display reservoir level and water temperature.
- REQ-DSH-003 (Ubiquitous): The dashboard shall display tent temperature and humidity when an environment sensor is available.
- REQ-DSH-004 (Ubiquitous): The dashboard shall display online module count and list.
- REQ-DSH-005 (Ubiquitous): The dashboard shall display plants needing water (moisture below targetMoistureMin).
- REQ-DSH-006 (Ubiquitous): The dashboard shall display active unacknowledged alerts.
- REQ-DSH-007 (Ubiquitous): The dashboard shall display the last 10 watering events.
- REQ-DSH-008 (Ubiquitous): The UI shall be usable on viewport widths from 320px to 1920px.

### Event-driven

- REQ-DSH-009 (Event-driven): When sensor data is updated, the dashboard shall refresh affected cards within 5 seconds via WebSocket.

## Main screens

| Screen | Content |
|--------|---------|
| Dashboard | System status, reservoir, environment, alerts, needs-water list |
| Modules | Discovered modules, status, identify, channel list, manual test |
| Plants | Plant name, channel, moisture, target range, last watered, profile |
| Automation | Watering rules, schedules, quiet hours, light schedule |
| Alerts | Active alerts, acknowledgement, maintenance history |

## Acceptance criteria

| REQ ID | Criterion | Verified by |
|--------|-----------|-------------|
| REQ-DSH-001 | System status displayed | Scenario: Dashboard shows system overview |
| REQ-DSH-005 | Needs-water list shown | Scenario: Plants needing water highlighted |
| REQ-DSH-006 | Active alerts displayed | Scenario: Active alerts on dashboard |
| REQ-DSH-008 | Mobile viewport usable | Scenario: Mobile viewport layout |

## Related artifacts

- Gherkin: [dashboard-monitoring.feature](dashboard-monitoring.feature)
- Sequence: [sequence.md](sequence.md)
