# Feature Spec: Environment and Light Control

**Feature ID:** 007-environment-light-control  
**Status:** Approved  
**Last updated:** 2026-05-31

## Summary

v1 environment control is simple: light schedules via certified smart plug, temperature/humidity monitoring, manual fan control, and alerts for out-of-range conditions.

## User stories

- As an operator, I want grow lights on a schedule so that plants receive consistent light hours.
- As an operator, I want to see tent temperature and humidity so that I know the environment is suitable.

## Requirements (EARS)

### Event-driven

- REQ-ENV-001 (Event-driven): When the light schedule start time is reached, the Hub shall send light_on to the configured smart plug.
- REQ-ENV-002 (Event-driven): When the light schedule end time is reached, the Hub shall send light_off to the configured smart plug.
- REQ-ENV-003 (Event-driven): When air temperature falls below 12 °C, the Hub shall create a warning temperature_low alert.
- REQ-ENV-004 (Event-driven): When air temperature exceeds 30 °C, the Hub shall create a warning temperature_high alert.
- REQ-ENV-005 (Event-driven): When the operator toggles the fan manually, the Hub shall send fan_on or fan_off to the configured smart plug.

### Ubiquitous

- REQ-ENV-006 (Ubiquitous): The Hub shall ingest air temperature and humidity from the environment sensor at least every 60 seconds.
- REQ-ENV-007 (Ubiquitous): Grow light and fan control shall use certified smart plugs only — no DIY mains wiring in the tent.

### Optional

- REQ-ENV-008 (Optional): Where a light dimmer is available (v2), the Hub shall support brightness schedules.

## Acceptance criteria

| REQ ID | Criterion | Verified by |
|--------|-----------|-------------|
| REQ-ENV-001 | Light turns on at schedule start | Scenario: Light schedule turns on |
| REQ-ENV-002 | Light turns off at schedule end | Scenario: Light schedule turns off |
| REQ-ENV-005 | Manual fan toggle works | Scenario: Manual fan control |
| REQ-ENV-003 | Low temperature alert | Scenario: Temperature low alert |

## Related artifacts

- Gherkin: [environment-light-control.feature](environment-light-control.feature)
- Sequence: [sequence.md](sequence.md)
- Hardware: [grow-tent.md](../../docs/hardware/grow-tent.md)
