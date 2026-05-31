# Feature Spec: Alerts and Maintenance

**Feature ID:** 006-alerts-maintenance  
**Status:** Approved  
**Last updated:** 2026-05-31

## Summary

The Hub raises alerts for fault conditions and maintenance reminders. Operators view, acknowledge, and resolve alerts via the UI.

## User stories

- As an operator, I want to see active alerts so that I know when the system needs attention.
- As an operator, I want maintenance reminders for filter cleaning and reservoir changes so that water quality stays good.

## Requirements (EARS)

### Event-driven

- REQ-ALT-001 (Event-driven): When a leak is detected, the Hub shall create a critical leak_detected alert.
- REQ-ALT-002 (Event-driven): When reservoir level is low, the Hub shall create a warning reservoir_low alert.
- REQ-ALT-003 (Event-driven): When a module has been offline for 5 minutes, the Hub shall create a warning module_offline alert.
- REQ-ALT-004 (Event-driven): When pump current exceeds threshold, the Hub shall create a warning pump_fault alert.
- REQ-ALT-005 (Event-driven): When water temperature exceeds 25 °C, the Hub shall create a warning water_too_warm alert.
- REQ-ALT-006 (Event-driven): When 30 days have elapsed since last filter cleaning, the Hub shall create an info filter_due alert.
- REQ-ALT-007 (Event-driven): When the operator acknowledges an alert, the Hub shall set acknowledged to true and record the timestamp.

### Ubiquitous

- REQ-ALT-008 (Ubiquitous): The UI shall display all unacknowledged alerts prominently on the dashboard.
- REQ-ALT-009 (Ubiquitous): The Hub shall deduplicate alerts of the same type for the same source within 15 minutes.

## Acceptance criteria

| REQ ID | Criterion | Verified by |
|--------|-----------|-------------|
| REQ-ALT-001 | Leak creates critical alert | Scenario: Leak alert raised |
| REQ-ALT-007 | Acknowledgement persisted | Scenario: Operator acknowledges alert |
| REQ-ALT-006 | Filter reminder after 30 days | Scenario: Filter maintenance reminder |
| REQ-ALT-009 | Duplicate alerts suppressed | Scenario: Duplicate alert deduplicated |

## Related artifacts

- Gherkin: [alerts-maintenance.feature](alerts-maintenance.feature)
- Sequence: [sequence.md](sequence.md)
