# Manual Watering — Sequence Diagrams

## Successful manual water

```mermaid
sequenceDiagram
    participant Operator
    participant UI as hub-ui
    participant HubAPI as hub-api
    participant PlantbusService as plantbus-service
    participant Module
    participant Valve
    participant Pump

    Operator->>UI: Press manual water on channel 2
    UI->>HubAPI: POST /channels/pm-8f3a91c2/2/water
    HubAPI->>HubAPI: Check safety preconditions
    HubAPI->>HubAPI: Acquire global watering lock
    HubAPI->>PlantbusService: COMMAND water cmd-0001 ch=2 8000ms
    PlantbusService->>Module: Forward COMMAND
    Module->>HubAPI: COMMAND_ACK accepted
    Module->>Module: Verify level ok, no leak
    Module->>Valve: Open valve 2
    Module->>Pump: Pump on
    Note over Module,Pump: Run 8000ms
    Module->>Pump: Pump off
    Module->>Valve: Close valve 2
    Module->>PlantbusService: EVENT water_complete
    PlantbusService->>HubAPI: Forward EVENT
    HubAPI->>HubAPI: Log ActuationEvent success
    HubAPI->>HubAPI: Release global watering lock
    HubAPI->>UI: WebSocket water_complete
    UI->>Operator: Show success + last watered time
```

## Blocked by safety

```mermaid
sequenceDiagram
    participant Operator
    participant UI as hub-ui
    participant HubAPI as hub-api

    Operator->>UI: Press manual water
    UI->>HubAPI: POST /channels/.../water
    HubAPI->>HubAPI: Check safety - leak active
    HubAPI->>HubAPI: Log ActuationEvent safety_blocked
    HubAPI->>UI: 403 safety_blocked leak_detected
    UI->>Operator: Display error message
```

## Related documents

- [spec.md](spec.md)
- [manual-watering.feature](manual-watering.feature)
- [005-safety-interlocks](../005-safety-interlocks/spec.md)
