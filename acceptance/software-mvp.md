# Software MVP Acceptance Criteria

Testable acceptance criteria for the Plant Ark software MVP (simulator-based, no hardware required).

## Overview

The software MVP is acceptable when all criteria below pass against the PlantBus simulator with 2× 4-channel modules.

## Criteria (EARS)

### Module discovery and registration

- REQ-MVP-SW-001 (Event-driven): When simulated modules start, the Hub shall auto-register both modules within 10 seconds.
- REQ-MVP-SW-002 (Ubiquitous): Each registered nursery-4ch-v1 module shall expose exactly 4 channels.

### Naming and assignment

- REQ-MVP-SW-003 (Event-driven): When the operator names a module and its channels via UI, the Hub shall persist the names.
- REQ-MVP-SW-004 (Event-driven): When the operator assigns a plant to a channel, the Hub shall persist the plant profile and channel assignment.

### Sensor display

- REQ-MVP-SW-005 (Event-driven): When a simulated module emits SENSOR_REPORT, the UI shall display moisture readings for all channels within 5 seconds.

### Manual watering

- REQ-MVP-SW-006 (Event-driven): When the operator triggers manual water on a channel, the Hub shall send a WATER command and log an ActuationEvent with result success on completion.
- REQ-MVP-SW-007 (Unwanted): If the simulated module is offline, then manual water shall fail with an error message.

### Automated watering

- REQ-MVP-SW-008 (Event-driven): When channel moisture falls below targetMoistureMin, the automation engine shall trigger a watering dose.
- REQ-MVP-SW-009 (Unwanted): If daily maxDosesPerDay is reached, then the automation engine shall not trigger additional doses.

### Safety

- REQ-MVP-SW-010 (Unwanted): If a simulated leak is reported, then all watering shall be blocked and a critical alert displayed.
- REQ-MVP-SW-011 (Unwanted): If a simulated reservoir low is reported, then all watering shall be blocked.

### Alerts

- REQ-MVP-SW-012 (Event-driven): When a fault condition occurs, the UI shall display an alert within 5 seconds.

### Meshtastic stub

- REQ-MVP-SW-013 (Event-driven): When the mesh-bridge receives a status summary, it shall log the JSON payload to console.
- REQ-MVP-SW-014 (Event-driven): When the mesh-bridge receives a critical alert, it shall log the alert JSON payload to console.

## Verification matrix

| Criterion | Feature spec | Gherkin scenario |
|-----------|--------------|------------------|
| REQ-MVP-SW-001 | 001-module-discovery | Module announces on connect |
| REQ-MVP-SW-003 | 001-module-discovery | Operator names module and channels |
| REQ-MVP-SW-004 | 002-channel-plant-assignment | Assign plant to channel |
| REQ-MVP-SW-005 | 009-dashboard-monitoring | Real-time sensor update |
| REQ-MVP-SW-006 | 003-manual-watering | Manual water succeeds |
| REQ-MVP-SW-008 | 004-automated-watering | Automation waters dry plant |
| REQ-MVP-SW-010 | 005-safety-interlocks | Leak blocks all watering |
| REQ-MVP-SW-012 | 006-alerts-maintenance | Leak alert raised |
| REQ-MVP-SW-013 | 008-meshtastic-status-alerts | Stub mode logs payload |

## Simulator requirements

The simulator shall provide:

- Module A: 4 channels (pm-aaaa0001)
- Module B: 4 channels (pm-bbbb0002)
- HELLO, HEARTBEAT, SENSOR_REPORT emission
- IDENTIFY and WATER command handling
- COMMAND_ACK and water_complete event response
- Configurable fault injection (leak, low level, offline)

## Related documents

- [Hardware MVP acceptance](hardware-mvp.md)
- [Traceability matrix](traceability.md)
- [Software architecture](../docs/architecture/software-architecture.md)
