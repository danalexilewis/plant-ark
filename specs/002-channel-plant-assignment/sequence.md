# Channel and Plant Assignment — Sequence Diagrams

## Assign plant to channel

```mermaid
sequenceDiagram
    participant Operator
    participant UI as hub-ui
    participant HubAPI as hub-api
    participant DB as SQLite

    Operator->>UI: Open channel "pm-8f3a91c2/1"
    Operator->>UI: Create plant "Tomato seedlings" with profile
    UI->>HubAPI: POST /plants
    HubAPI->>DB: Insert Plant record
    HubAPI->>UI: Return plant id

    Operator->>UI: Assign plant to channel 1
    UI->>HubAPI: PATCH /channels/pm-8f3a91c2/1 plantId
    HubAPI->>DB: Update Channel.plantId
    HubAPI->>UI: Return updated channel
    UI->>Operator: Show plant on channel card
```

## Automation reads assignment

```mermaid
sequenceDiagram
    participant AutoEngine as automation-engine
    participant HubAPI as hub-api
    participant DB as SQLite

    AutoEngine->>HubAPI: GET /channels?enabled=true&hasPlant=true
    HubAPI->>DB: Query channels with plants
    DB->>HubAPI: Channel + Plant join
    HubAPI->>AutoEngine: Channels with watering profiles
    AutoEngine->>AutoEngine: Evaluate moisture vs targetMoistureMin
```

## Related documents

- [spec.md](spec.md)
- [channel-plant-assignment.feature](channel-plant-assignment.feature)
- [004-automated-watering](../004-automated-watering/spec.md)
