# Alerts and Maintenance — Sequence Diagrams

## Alert creation flow

```mermaid
sequenceDiagram
    participant Module
    participant HubAPI as hub-api
    participant UI as hub-ui
    participant MeshBridge as mesh-bridge

    Module->>HubAPI: SENSOR_REPORT leak=true
    HubAPI->>HubAPI: Check dedup window
    HubAPI->>HubAPI: Create Alert severity=critical type=leak_detected
    HubAPI->>UI: WebSocket alert_created
    HubAPI->>MeshBridge: Forward critical alert
    UI->>UI: Display alert banner on dashboard
```

## Maintenance reminder evaluation

```mermaid
sequenceDiagram
    participant AutoEngine as automation-engine
    participant HubAPI as hub-api
    participant UI as hub-ui

    loop Daily at 08:00
        AutoEngine->>HubAPI: GET maintenance schedule state
        HubAPI->>HubAPI: Check filter_cleaning_last_date per module
        alt > 30 days since last cleaning
            HubAPI->>HubAPI: Create filter_due alert
            HubAPI->>UI: WebSocket alert_created
        end
        HubAPI->>HubAPI: Check reservoir_change_last_date
        alt > 21 days since last change
            HubAPI->>HubAPI: Create manual_attention alert reservoir change due
        end
    end
```

## Acknowledgement

```mermaid
sequenceDiagram
    participant Operator
    participant UI as hub-ui
    participant HubAPI as hub-api

    Operator->>UI: Click acknowledge on alert
    UI->>HubAPI: PATCH /alerts/{id} acknowledged=true
    HubAPI->>HubAPI: Update Alert record
    HubAPI->>UI: Return updated alert
    UI->>Operator: Move to acknowledged section
```

## Related documents

- [spec.md](spec.md)
- [008-meshtastic-status-alerts](../008-meshtastic-status-alerts/spec.md)
