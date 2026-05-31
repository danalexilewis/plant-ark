# Feature Spec: Channel and Plant Assignment

**Feature ID:** 002-channel-plant-assignment  
**Status:** Approved  
**Last updated:** 2026-05-31

## Summary

Operators assign plants to module channels, configure watering profiles, and set channel mode (pot or seedling-zone). Each channel can have one plant or remain empty/disabled.

## User stories

- As an operator, I want to assign a plant to a channel so that automation uses the correct watering profile.
- As an operator, I want to set channel mode so that the system knows whether it is watering a pot or a seedling zone.

## Requirements (EARS)

### Ubiquitous

- REQ-CHN-001 (Ubiquitous): Each channel shall support at most one assigned plant.
- REQ-CHN-002 (Ubiquitous): Each channel shall have a mode of either pot or seedling-zone.
- REQ-CHN-003 (Ubiquitous): Each channel shall have an enabled flag defaulting to true.

### Event-driven

- REQ-CHN-004 (Event-driven): When the operator assigns a plant to a channel, the Hub shall persist the plantId on the channel record.
- REQ-CHN-005 (Event-driven): When the operator creates a new plant, the Hub shall store the plant profile including targetMoistureMin, targetMoistureMax, doseMs, soakWaitMinutes, and maxDosesPerDay.
- REQ-CHN-006 (Event-driven): When the operator disables a channel, the Hub shall skip that channel in automation evaluation.
- REQ-CHN-007 (Event-driven): When the operator unassigns a plant from a channel, the Hub shall set plantId to null and exclude the channel from automation.

### Optional

- REQ-CHN-008 (Optional): Where quiet hours are configured on a plant, the Hub shall suppress automated watering for that plant during quiet hours unless moisture is critically low.

## Acceptance criteria

| REQ ID | Criterion | Verified by |
|--------|-----------|-------------|
| REQ-CHN-004 | Plant assignment persisted on channel | Scenario: Assign plant to channel |
| REQ-CHN-005 | Plant profile stored with all watering fields | Scenario: Create plant profile |
| REQ-CHN-006 | Disabled channel excluded from automation | Scenario: Disable channel |
| REQ-CHN-002 | Channel mode set to pot or seedling-zone | Scenario: Set channel mode |

## Related artifacts

- Gherkin: [channel-plant-assignment.feature](channel-plant-assignment.feature)
- Sequence: [sequence.md](sequence.md)
- Data model: [entities.md](../../docs/data-model/entities.md)
