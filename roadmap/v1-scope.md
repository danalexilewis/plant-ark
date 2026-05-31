# V1 Scope

First serious prototype scope for Plant Ark.

## Product scope

A fold-out indoor nursery cart with drop-in recirculating tray, soft grow tent, and plug-in 4-channel irrigation modules for seedlings and overwintering plants.

## v1 hardware deliverables

| Item | Quantity | Notes |
|------|----------|-------|
| Fold-out cart frame | 1 | Wheeled, locking casters |
| Opaque reservoir tray | 1 | Drop-in, recirculating |
| Removable plant deck | 1 | Pot or seedling insert |
| Soft grow tent | 1 | Reflective liner |
| LED grow light bar | 1 | Via certified smart plug |
| 4-channel irrigation module | 1–2 | Bench prototype first, then cart-integrated |
| Home Plant Hub | 1 | Raspberry Pi 4/5 or mini PC |
| Optional Meshtastic node | 0–1 | Not required |

## v1 software deliverables

| Service | Scope |
|---------|-------|
| hub-api | REST/WebSocket, registry, logging |
| plantbus-service | CAN adapter, discovery, commands |
| hub-ui | Dashboard, modules, plants, automation, alerts |
| automation-engine | Rule-based watering, light schedule |
| simulator | 2× 4-channel fake modules |
| mesh-bridge | Stub — console log payloads |

## Channel capacity

| Parameter | v1 | Long-term |
|-----------|-----|-----------|
| Modules | 1–2 | Up to 5 |
| Channels per module | 4 | 4 |
| Total plants/zones | 4–8 | 20 |

## Operating modes in v1

- **Seedling mode** — zone watering with seedling tray insert
- **Plant mode** — one channel per pot

## Environment control in v1

- Light on/off schedule via certified smart plug
- Temperature and humidity monitoring
- Manual fan on/off
- Alerts for out-of-range conditions

Not in v1: dimming, fan speed control, heat mat, humidifier/dehumidifier automation.

## Documentation deliverables (this repo phase)

- Reference library (`docs/`)
- Feature specs with EARS + Gherkin + sequence diagrams (`specs/`)
- Acceptance criteria (`acceptance/`)
- Roadmap and traceability (`roadmap/`, `acceptance/traceability.md`)

## Related documents

- [Open questions](open-questions.md)
- [Non-goals](non-goals.md)
- [Future](future.md)
- [Software MVP acceptance](../acceptance/software-mvp.md)
- [Hardware MVP acceptance](../acceptance/hardware-mvp.md)
