# External Standards and References

Standards and external specifications referenced by Plant Ark.

## Electrical and bus standards

| Standard | Application |
|----------|-------------|
| ISO 11898-2 | CAN bus physical layer |
| ISO 11898-1 | CAN data link layer |
| IEC 60335-1 | Household appliance safety (reference for future productisation) |
| IP67 (IEC 60529) | M12 connector ingress protection target |

## CAN bus references

| Topic | Reference |
|-------|-----------|
| CAN bit rates vs cable length | ISO 11898 — 250 kbps to ~40 m, 500 kbps to ~20 m |
| Termination | 120 Ω at each end of linear bus |
| SocketCAN | Linux kernel CAN subsystem — Hub interface |
| CANable / gs_usb | Open-source USB-CAN adapter firmware |

## Connector standards

| Connector | Standard | Plant Ark use |
|-----------|----------|---------------|
| RJ45 8P8C | IEC 60603-7 | Prototype PlantBus only — NOT Ethernet |
| M12 A-coded 5-pin | IEC 61076-2-101 | Production PlantBus |
| Barbed fittings | Industry standard | 4–6 mm irrigation tubing |

## Safety standards (reference)

| Standard | Relevance |
|----------|-----------|
| IEC 60335-2-41 | Electric pumps for liquids (pump selection reference) |
| UL 778 | Motor-operated water pumps (reference) |
| CE marking | Target for commercial product (future) |

## Software standards

| Standard / tool | Application |
|-----------------|-------------|
| EARS notation | Requirements authoring — see [Alistair Mavin EARS](https://alistairmavin.com/ears/) |
| Gherkin | UX flow specification |
| JSON Schema / Zod | Data validation (future implementation) |
| Docker Compose | Local service orchestration |

## Meshtastic

| Topic | Reference |
|-------|-----------|
| Meshtastic protocol | [meshtastic.org/docs](https://meshtastic.org/docs) |
| MQTT module | Optional bridge interface |
| Rate limits | Plant Ark: summaries 30–60 min, alerts deduplicated 10–15 min |

## Horticulture references

| Topic | Notes |
|-------|-------|
| Capacitive soil moisture | Calibration per soil mix; normalize to 0.0–1.0 |
| Seedling watering | Capillary/flood strips preferred over drippers for uniform zone wetting |
| Recirculating reservoir hygiene | Light blocking, filtration, periodic drain/refill |
| Water temperature | 15–22 °C typical for seedlings; alert if > 25 °C |

## Open source tools (future implementation)

| Tool | Purpose |
|------|---------|
| GitHub Spec Kit | SDD workflow inspiration |
| SocketCAN | Hub CAN interface |
| Fastify | Hub API |
| React + Vite | Hub UI |

## Related documents

- [PlantBus physical layer](../protocol/plantbus-physical-layer.md)
- [Electrical safety](../safety/electrical-safety.md)
- [Meshtastic integration](../integrations/meshtastic.md)
