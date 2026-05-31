# Environment and Light Control — Sequence Diagrams

## Light schedule

```mermaid
sequenceDiagram
    participant AutoEngine as automation-engine
    participant HubAPI as hub-api
    participant SmartPlug as certified smart plug
    participant UI as hub-ui

    Note over AutoEngine: 06:00 schedule trigger
    AutoEngine->>HubAPI: Execute light schedule start
    HubAPI->>SmartPlug: light_on command
    SmartPlug->>HubAPI: Acknowledgement
    HubAPI->>HubAPI: Log ActuationEvent light_on
    HubAPI->>UI: WebSocket light_state on

    Note over AutoEngine: 22:00 schedule trigger
    AutoEngine->>HubAPI: Execute light schedule end
    HubAPI->>SmartPlug: light_off command
    HubAPI->>UI: WebSocket light_state off
```

## Environment sensor ingestion

```mermaid
sequenceDiagram
    participant EnvSensor as environment sensor
    participant HubAPI as hub-api
    participant UI as hub-ui

    EnvSensor->>HubAPI: Temperature 19.1C humidity 68%
    HubAPI->>HubAPI: Insert SensorReading rows
    HubAPI->>HubAPI: Evaluate alert thresholds
    HubAPI->>UI: WebSocket sensor_update
    UI->>UI: Update dashboard environment cards
```

## Related documents

- [spec.md](spec.md)
- [environment-light-control.feature](environment-light-control.feature)
- [009-dashboard-monitoring](../009-dashboard-monitoring/spec.md)
