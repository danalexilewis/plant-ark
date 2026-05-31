# Feature Spec: Safety Interlocks

**Feature ID:** 005-safety-interlocks  
**Status:** Approved  
**Last updated:** 2026-05-31

## Summary

Multi-layer safety enforcement at module firmware and Hub levels. Prevents unsafe watering conditions including leaks, low reservoir, pump faults, and concurrent watering conflicts.

## User stories

- As an operator, I want the system to fail safe so that water damage and equipment damage are prevented.
- As an operator, I want clear alerts when safety conditions block watering so that I can take corrective action.

## Requirements (EARS)

### Module-level (firmware)

- REQ-SAF-001 (Ubiquitous): The module shall boot with pump off and all valves closed.
- REQ-SAF-002 (Unwanted): If bus communication timeout exceeds 10 seconds, then the module shall stop the pump and close all valves.
- REQ-SAF-003 (Unwanted): If the leak sensor is active, then the module shall stop the pump and close all valves.
- REQ-SAF-004 (Unwanted): If water level is low, then the module shall reject watering commands.
- REQ-SAF-005 (Ubiquitous): The module shall never open more than one valve simultaneously.
- REQ-SAF-006 (Ubiquitous): The module shall never run the pump longer than max_duration_ms.
- REQ-SAF-007 (Ubiquitous): The module shall reject duplicate command_id values.

### Hub-level

- REQ-SAF-008 (Ubiquitous): The Hub shall enforce a global watering lock allowing only one active watering command at a time.
- REQ-SAF-009 (Unwanted): If any module reports leak active, then the Hub shall block all watering globally.
- REQ-SAF-010 (Unwanted): If reservoir level is low, then the Hub shall block all watering globally.
- REQ-SAF-011 (Unwanted): If pump current exceeds 1500 mA, then the Hub shall raise a pump_fault alert and block watering for that module.
- REQ-SAF-012 (Unwanted): If watering does not increase moisture after 3 consecutive doses, then the Hub shall raise a manual_attention alert.

## Acceptance criteria

| REQ ID | Criterion | Verified by |
|--------|-----------|-------------|
| REQ-SAF-003 | Leak stops pump and blocks watering | Scenario: Leak blocks all watering |
| REQ-SAF-010 | Low reservoir blocks all watering | Scenario: Low reservoir blocks watering |
| REQ-SAF-008 | Only one channel waters at a time | Scenario: Global lock prevents concurrent watering |
| REQ-SAF-006 | Pump stops at max_duration_ms | Scenario: Module enforces max pump duration |

## Related artifacts

- Gherkin: [safety-interlocks.feature](safety-interlocks.feature)
- Sequence: [sequence.md](sequence.md)
- Constitution: [constitution.md](../../constitution.md)
- Safety docs: [safety-requirements.md](../../docs/safety/safety-requirements.md)
