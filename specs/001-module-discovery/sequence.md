# Module Discovery — Sequence Diagrams

## Module power-on and registration

```mermaid
sequenceDiagram
    participant Operator
    participant Module
    participant PlantBus
    participant PlantbusService as plantbus-service
    participant HubAPI as hub-api
    participant UI as hub-ui

    Operator->>Module: Power on / plug into PlantBus
    Module->>PlantBus: HELLO module_id type channels capabilities
    PlantBus->>PlantbusService: Forward HELLO
    PlantbusService->>HubAPI: Register module
    HubAPI->>HubAPI: Create Module record
    HubAPI->>HubAPI: Create 4 Channel slots
    HubAPI->>UI: WebSocket module_discovered event
    UI->>Operator: Show "New module found"

    loop Every 30s
        Module->>PlantBus: HEARTBEAT
        PlantBus->>PlantbusService: Forward HEARTBEAT
        PlantbusService->>HubAPI: Update lastSeenAt
    end
```

## Identify flow

```mermaid
sequenceDiagram
    participant Operator
    participant Module
    participant PlantbusService as plantbus-service
    participant HubAPI as hub-api
    participant UI as hub-ui

    Operator->>Module: Press identify button
    Module->>PlantbusService: EVENT identify_pressed
    PlantbusService->>HubAPI: Forward identify event
    HubAPI->>UI: WebSocket module_identify event
    UI->>Operator: Highlight module card + name prompt
    Operator->>UI: Enter module name and channel names
    UI->>HubAPI: PATCH /modules/{id} name + channels
    HubAPI->>HubAPI: Persist names
    UI->>Operator: Show named module
```

## Offline detection

```mermaid
sequenceDiagram
    participant Module
    participant PlantbusService as plantbus-service
    participant HubAPI as hub-api
    participant UI as hub-ui

    Module--xPlantbusService: Connection lost
    Note over PlantbusService,HubAPI: 90s without HEARTBEAT
    HubAPI->>HubAPI: Set module status offline
    HubAPI->>UI: WebSocket module_offline event
    UI->>UI: Display offline badge
```

## Related documents

- [spec.md](spec.md)
- [module-discovery.feature](module-discovery.feature)
- [PlantBus messages](../../docs/protocol/plantbus-messages.md)
