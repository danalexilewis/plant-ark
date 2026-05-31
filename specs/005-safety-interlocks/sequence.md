# Safety Interlocks — Sequence Diagrams

## Leak detection and global block

```mermaid
sequenceDiagram
    participant Module
    participant PlantbusService as plantbus-service
    participant HubAPI as hub-api
    participant AutoEngine as automation-engine
    participant UI as hub-ui

    Module->>PlantbusService: SENSOR_REPORT leak=true
    PlantbusService->>HubAPI: Forward report
    HubAPI->>HubAPI: Set global safety lock LEAK
    HubAPI->>HubAPI: Create critical leak_detected alert
    Module->>Module: Stop pump, close all valves

    AutoEngine->>HubAPI: Request water channel 1
    HubAPI->>AutoEngine: Rejected safety_blocked
    HubAPI->>UI: WebSocket alert leak_detected
```

## Global watering lock

```mermaid
sequenceDiagram
    participant AutoEngine as automation-engine
    participant HubAPI as hub-api
    participant Module

    AutoEngine->>HubAPI: Water channel 1
    HubAPI->>HubAPI: Acquire globalWateringLock
    HubAPI->>Module: COMMAND water ch=1
    Note over HubAPI: Lock held

    AutoEngine->>HubAPI: Water channel 2
    HubAPI->>HubAPI: Lock held - queue command
    HubAPI->>AutoEngine: Queued

    Module->>HubAPI: EVENT water_complete ch=1
    HubAPI->>HubAPI: Release lock, process queue
    HubAPI->>Module: COMMAND water ch=2
```

## Module bus timeout safe state

```mermaid
sequenceDiagram
    participant HubAPI as hub-api
    participant Module
    participant Pump
    participant Valves

    Module->>Pump: Pump on (watering)
    Note over Module: 10s no bus message
    Module->>Module: Watchdog timeout triggered
    Module->>Pump: Pump off
    Module->>Valves: All valves close
    Module->>Module: Enter safe idle state
```

## Related documents

- [spec.md](spec.md)
- [safety-interlocks.feature](safety-interlocks.feature)
- [constitution.md](../../constitution.md)
