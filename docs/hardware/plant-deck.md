# Plant Deck

The removable plant deck sits above the reservoir tray and supports plants or seedling inserts.

## Purpose

Provides a removable platform for pots, seedling cells, or capillary mats. Routes drip lines cleanly and allows excess water to drain back into the reservoir.

## Requirements

| ID | Requirement |
|----|-------------|
| REQ-HW-PD-001 (Ubiquitous) | The plant deck shall be removable without tools. |
| REQ-HW-PD-002 (Ubiquitous) | The plant deck shall allow excess water to drain back into the reservoir tray. |
| REQ-HW-PD-003 (Ubiquitous) | The plant deck shall support interchangeable inserts for different growing modes. |
| REQ-HW-PD-004 (Ubiquitous) | The plant deck shall route drip lines from module outputs to plant locations. |
| REQ-HW-PD-005 (Ubiquitous) | The plant deck shall provide holes or slots for plant pots or seedling cells. |
| REQ-HW-PD-006 (Ubiquitous) | The plant deck shall be easy to clean. |

## Supported inserts

| Insert | Mode | Watering method |
|--------|------|-----------------|
| Seedling tray insert | Seedling mode | Zone drippers or capillary/flood strips |
| Pot insert | Plant mode | Individual drippers per pot |
| Propagation insert | Seedling mode | Capillary mat or mist zone |
| Capillary mat insert | Seedling mode | Flood strips wicking into cells |

**Open design note:** Test both drippers and capillary strips for seedling mode. Likely: capillary/flood strips for seedlings, drippers for pots.

## Layout (plant mode, 4 channels)

```
┌─────────────────────────────────────────┐
│  ┌───┐   ┌───┐   ┌───┐   ┌───┐         │
│  │ 1 │   │ 2 │   │ 3 │   │ 4 │  pots   │
│  └───┘   └───┘   └───┘   └───┘         │
│   ↓       ↓       ↓       ↓   drippers  │
├─────────────────────────────────────────┤
│         drainage holes → reservoir       │
└─────────────────────────────────────────┘
```

## Layout (seedling mode, 4 zones)

```
┌─────────────────────────────────────────┐
│  zone 1  │  zone 2  │  zone 3  │ zone 4 │
│  ▪▪▪▪▪▪  │  ▪▪▪▪▪▪  │  ▪▪▪▪▪▪  │ ▪▪▪▪▪▪ │
│  cells   │  cells   │  cells   │ cells  │
├─────────────────────────────────────────┤
│    capillary strip or drip bar per zone  │
├─────────────────────────────────────────┤
│         drainage → reservoir             │
└─────────────────────────────────────────┘
```

## Drip line routing

- Lines enter from module side via clip-on guides on deck edge
- Dark/opaque tubing to minimise light exposure
- Excess line coiled in cable management clips (not in reservoir)
- Each channel line labelled to match UI channel name

## Materials (prototype)

| Component | Material | Notes |
|-----------|----------|-------|
| Deck frame | PP or ABS plastic | Rigid, drain holes |
| Inserts | Molded PP trays | Standard seedling tray sizes where possible |
| Drain screen | Stainless mesh | Prevents medium falling into reservoir |

## Related documents

- [Reservoir tray](reservoir-tray.md)
- [Irrigation module](irrigation-module.md)
- [System architecture](../architecture/system-architecture.md) — operating modes
