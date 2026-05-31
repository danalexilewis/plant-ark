# Dashboard Monitoring — Sequence Diagrams

## Dashboard load

```mermaid
sequenceDiagram
    participant Operator
    participant UI as hub-ui
    participant HubAPI as hub-api

    Operator->>UI: Open dashboard /
    UI->>HubAPI: GET /status/summary
    UI->>HubAPI: GET /modules?include=channels,plants
    UI->>HubAPI: GET /alerts?acknowledged=false
    UI->>HubAPI: GET /events/watering?limit=10
    HubAPI->>UI: Aggregated dashboard data
    UI->>Operator: Render dashboard cards
```

## Real-time WebSocket updates

```mermaid
sequenceDiagram
    participant Module
    participant HubAPI as hub-api
    participant UI as hub-ui
    participant Operator

    Module->>HubAPI: SENSOR_REPORT
    HubAPI->>HubAPI: Store readings, evaluate alerts
    HubAPI->>UI: WebSocket sensor_update
    UI->>UI: Update moisture cards
    UI->>Operator: Refreshed values visible

    HubAPI->>UI: WebSocket alert_created
    UI->>UI: Show alert banner
```

## Related documents

- [spec.md](spec.md)
- [dashboard-monitoring.feature](dashboard-monitoring.feature)
- [Software architecture](../../docs/architecture/software-architecture.md)
