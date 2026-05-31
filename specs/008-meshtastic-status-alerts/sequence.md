# Meshtastic Status and Alerts — Sequence Diagrams

## Periodic summary publish

```mermaid
sequenceDiagram
    participant AutoEngine as automation-engine
    participant HubAPI as hub-api
    participant MeshBridge as mesh-bridge
    participant Meshtastic as Meshtastic node

    loop Every 30 minutes
        MeshBridge->>HubAPI: GET /status/summary
        HubAPI->>MeshBridge: plant_hub_status payload
        alt Meshtastic connected
            MeshBridge->>Meshtastic: Publish LoRa packet
        else Stub mode
            MeshBridge->>MeshBridge: console.log payload
        end
    end
```

## Critical alert publish

```mermaid
sequenceDiagram
    participant HubAPI as hub-api
    participant MeshBridge as mesh-bridge
    participant Meshtastic as Meshtastic node

    HubAPI->>HubAPI: Create critical alert leak_detected
    HubAPI->>MeshBridge: POST /mesh/alert
    MeshBridge->>MeshBridge: Check dedup window
    alt Not deduplicated
        alt Meshtastic connected
            MeshBridge->>Meshtastic: Publish alert packet
        else Stub mode
            MeshBridge->>MeshBridge: console.log alert payload
        end
    end
```

## Related documents

- [spec.md](spec.md)
- [meshtastic.md](../../docs/integrations/meshtastic.md)
- [006-alerts-maintenance](../006-alerts-maintenance/spec.md)
