# Automated Watering — Sequence Diagrams

## Automation evaluation loop

```mermaid
sequenceDiagram
    participant AutoEngine as automation-engine
    participant HubAPI as hub-api
    participant PlantbusService as plantbus-service
    participant Module

    loop Every 15 minutes
        AutoEngine->>HubAPI: GET eligible channels + latest moisture
        HubAPI->>AutoEngine: Channels with plants and sensor data

        AutoEngine->>AutoEngine: For each channel check rules

        alt moisture below target and allowed
            AutoEngine->>HubAPI: POST queue water command
            HubAPI->>HubAPI: Safety checks + acquire lock
            HubAPI->>PlantbusService: COMMAND water
            PlantbusService->>Module: Forward COMMAND
            Module->>HubAPI: EVENT water_complete
            HubAPI->>AutoEngine: Dose complete
            AutoEngine->>AutoEngine: Schedule re-eval after soakWaitMinutes
        else skip
            AutoEngine->>HubAPI: POST log decision skip
        end
    end
```

## Soak wait and re-evaluation

```mermaid
sequenceDiagram
    participant AutoEngine as automation-engine
    participant HubAPI as hub-api

    Note over AutoEngine: water_complete received
    AutoEngine->>AutoEngine: Wait soakWaitMinutes (e.g. 10 min)
    AutoEngine->>HubAPI: GET latest moisture for channel
    HubAPI->>AutoEngine: moisture_norm 0.38

    alt still below targetMoistureMin and under daily max
        AutoEngine->>HubAPI: Queue another dose
    else moisture recovered
        AutoEngine->>AutoEngine: No action needed
    end
```

## Related documents

- [spec.md](spec.md)
- [automated-watering.feature](automated-watering.feature)
- [003-manual-watering](../003-manual-watering/spec.md)
