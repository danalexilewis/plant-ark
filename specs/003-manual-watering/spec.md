# Feature Spec: Manual Watering

**Feature ID:** 003-manual-watering  
**Status:** Approved  
**Last updated:** 2026-05-31

## Summary

Operators can trigger a manual watering dose on any enabled channel via the UI. The Hub sends a WATER command to the module, logs the actuation event, and displays the result.

## User stories

- As an operator, I want to manually water a channel so that I can test the system or give extra water when needed.
- As an operator, I want to see the result of a manual watering command so that I know it succeeded or was blocked.

## Requirements (EARS)

### Event-driven

- REQ-MAN-001 (Event-driven): When the operator presses the manual water button for a channel, the Hub shall queue a WATER command with the plant doseMs duration.
- REQ-MAN-002 (Event-driven): When the Hub sends a WATER command, the Hub shall generate a unique command_id.
- REQ-MAN-003 (Event-driven): When the module completes watering, the Hub shall log an ActuationEvent with result success and actualDurationMs.
- REQ-MAN-004 (Event-driven): When the module rejects a WATER command, the Hub shall log an ActuationEvent with result failed and the rejection reason.

### Unwanted behavior

- REQ-MAN-005 (Unwanted): If the module is offline, then the Hub shall reject the manual water request and display an error to the operator.
- REQ-MAN-006 (Unwanted): If a global safety lock is active (leak or reservoir low), then the Hub shall reject the manual water request with result safety_blocked.
- REQ-MAN-007 (Unwanted): If the global watering lock is held by another channel, then the Hub shall queue the manual water request until the lock is released.

### State-driven

- REQ-MAN-008 (State-driven): While a watering command is in progress for a channel, the UI shall display a watering-in-progress indicator on that channel.

## Acceptance criteria

| REQ ID | Criterion | Verified by |
|--------|-----------|-------------|
| REQ-MAN-001 | Manual water sends WATER command | Scenario: Manual water succeeds |
| REQ-MAN-003 | ActuationEvent logged on success | Scenario: Manual water succeeds |
| REQ-MAN-005 | Offline module blocks manual water | Scenario: Manual water blocked module offline |
| REQ-MAN-006 | Leak blocks manual water | Scenario: Manual water blocked by leak |

## Related artifacts

- Gherkin: [manual-watering.feature](manual-watering.feature)
- Sequence: [sequence.md](sequence.md)
- Safety: [005-safety-interlocks](../005-safety-interlocks/spec.md)
