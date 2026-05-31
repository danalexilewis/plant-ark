# Feature Spec: Module Discovery

**Feature ID:** 001-module-discovery  
**Status:** Approved  
**Last updated:** 2026-05-31

## Summary

When an irrigation module is powered on and connected to PlantBus, it announces itself via HELLO. The Hub registers the module, creates four channel slots, and presents it in the UI for naming and identification.

## User stories

- As an operator, I want modules to auto-register when plugged in so that I don't need manual bus configuration.
- As an operator, I want to press an identify button on a module so that I can match the physical module to the UI.

## Requirements (EARS)

### Ubiquitous

- REQ-DIS-001 (Ubiquitous): The irrigation module shall send a HELLO message on PlantBus within 5 seconds of power-on.
- REQ-DIS-002 (Ubiquitous): The HELLO message shall include module_id, module_type, firmware_version, channels, and capabilities.
- REQ-DIS-003 (Ubiquitous): The Hub shall create four channel slots for each registered nursery-4ch-v1 module.
- REQ-DIS-004 (Ubiquitous): Channel logical IDs shall use the format `{moduleId}/{channelNumber}`.
- REQ-DIS-005 (Ubiquitous): The Hub shall not depend on physical bus chain order for module identity.

### Event-driven

- REQ-DIS-006 (Event-driven): When the Hub receives a HELLO message, the Hub shall register or update the module in persistent storage.
- REQ-DIS-007 (Event-driven): When the Hub receives a HELLO for an unknown module_id, the Hub shall create a new module record with status online.
- REQ-DIS-008 (Event-driven): When the operator presses the physical identify button, the module shall notify the Hub and the UI shall highlight the matching module card.
- REQ-DIS-009 (Event-driven): When the Hub receives a HEARTBEAT, the Hub shall update the module lastSeenAt timestamp and set status to online.
- REQ-DIS-010 (Event-driven): When a module has not sent HEARTBEAT for 90 seconds, the Hub shall set the module status to offline.

### State-driven

- REQ-DIS-011 (State-driven): While a module is unregistered in the UI (name is null), the UI shall display the module as "New module found".

## Acceptance criteria

| REQ ID | Criterion | Verified by |
|--------|-----------|-------------|
| REQ-DIS-001 | Module sends HELLO within 5s of power-on | Scenario: Module announces on connect |
| REQ-DIS-006 | Hub creates module record on HELLO | Scenario: Module announces on connect |
| REQ-DIS-003 | Four channels created per module | Scenario: Module announces on connect |
| REQ-DIS-008 | Identify button highlights module in UI | Scenario: Operator identifies module |
| REQ-DIS-010 | Module marked offline after 90s no heartbeat | Scenario: Module goes offline |

## Related artifacts

- Gherkin: [module-discovery.feature](module-discovery.feature)
- Sequence: [sequence.md](sequence.md)
- Protocol: [PlantBus messages](../../docs/protocol/plantbus-messages.md)
- Data model: [Module entity](../../docs/data-model/entities.md)
