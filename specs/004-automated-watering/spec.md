# Feature Spec: Automated Watering

**Feature ID:** 004-automated-watering  
**Status:** Approved  
**Last updated:** 2026-05-31

## Summary

The automation engine periodically evaluates all enabled channels with assigned plants. When moisture falls below targetMoistureMin, it queues a watering dose respecting daily limits, quiet hours, and safety interlocks.

## User stories

- As an operator, I want the system to water plants automatically when soil is dry so that I don't need daily manual attention.
- As an operator, I want watering limits and quiet hours respected so that plants aren't over-watered or disturbed at night.

## Requirements (EARS)

### Event-driven

- REQ-AUT-001 (Event-driven): When channel moisture_norm falls below the assigned plant targetMoistureMin, the automation engine shall queue one watering dose for that channel.
- REQ-AUT-002 (Event-driven): When a watering dose completes, the Hub shall wait soakWaitMinutes before re-evaluating moisture for that channel.
- REQ-AUT-003 (Event-driven): When moisture remains below targetMoistureMin after soak wait and daily limit allows, the automation engine may queue another dose.

### State-driven

- REQ-AUT-004 (State-driven): While quiet hours are active for a plant, the automation engine shall skip watering for that plant unless moisture is critically below targetMoistureMin minus 0.10.

### Unwanted behavior

- REQ-AUT-005 (Unwanted): If the plant daily dose count has reached maxDosesPerDay, then the automation engine shall skip watering for that plant until the next calendar day.
- REQ-AUT-006 (Unwanted): If the channel is disabled, then the automation engine shall skip that channel.
- REQ-AUT-007 (Unwanted): If the assigned module is offline, then the automation engine shall skip that channel. Alerting is handled by REQ-ALT-003 after 5 minutes continuous offline — see [timing and alerting reference](../../docs/references/timing-and-alerting.md).

### Ubiquitous

- REQ-AUT-008 (Ubiquitous): The automation engine shall evaluate all eligible channels at least every 15 minutes.
- REQ-AUT-009 (Ubiquitous): The automation engine shall log every watering decision including skips with reason.

## Automation pseudo-code

```
for each plant:
  if channel disabled: skip
  if module offline: alert and skip
  if leak detected: block all watering
  if reservoir low: block all watering
  if daily water budget exceeded: skip
  if quiet hours active: skip unless critical
  if moisture < targetMoistureMin:
    queueWateringDose(plant)
```

## Acceptance criteria

| REQ ID | Criterion | Verified by |
|--------|-----------|-------------|
| REQ-AUT-001 | Dry plant triggers watering | Scenario: Automation waters dry plant |
| REQ-AUT-005 | Daily max prevents over-watering | Scenario: Daily max reached |
| REQ-AUT-004 | Quiet hours suppress watering | Scenario: Quiet hours suppress watering |
| REQ-AUT-009 | Skip decisions logged | Scenario: Automation skips disabled channel |

## Related artifacts

- Gherkin: [automated-watering.feature](automated-watering.feature)
- Sequence: [sequence.md](sequence.md)
- Safety: [005-safety-interlocks](../005-safety-interlocks/spec.md)
