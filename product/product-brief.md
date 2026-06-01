# Product Brief

Plant Ark is a modular fold-out indoor nursery cart — a practical gardening appliance assembled from proven off-the-shelf parts, not a bespoke hydroponics machine.

## Problem statement

Indoor gardeners face a gap between two bad options:

1. **Countertop smart gardens** (AeroGarden, Click & Grow) — easy but locked to proprietary pods, limited to herbs, and not suited to overwintering real pots or running a seedling tray at scale.
2. **DIY setups** (Pi + ESPHome + AliExpress parts) — flexible but fragile, undocumented, and require ongoing maintenance from someone who enjoys tinkering.

Neither option gives a **reliable, local-first, modular nursery** for seedlings and overwintering plants that a normal gardener can set up, trust, and repair.

## Vision

Unfold the cart, drop in the tray, add the tent, clip in the modules, and run a small indoor nursery with automated watering, lighting schedules, and monitoring — **without a cloud account, subscription, or proprietary consumables**.

## Target users (summary)

| Persona | Primary job |
|---------|-------------|
| Seedling Starter | Start 20–40 seedlings with even moisture through germination |
| Overwinterer | Keep herbs and tender plants alive through winter indoors |
| Maker/Tinkerer | Build, repair, and extend a modular local-first system |
| Away Traveler | Get critical alerts when away (optional Meshtastic) |

See [personas.md](personas.md) for full profiles.

## Value proposition

| Benefit | How Plant Ark delivers it |
|---------|---------------------------|
| Works with **your** plants and pots | Modular 4-channel irrigation, not locked pod slots |
| **Local-first** — no account required | Hub runs on your network; data stays home |
| **Repairable** | Modules clip off; pump cassette removes without tools |
| **Predictable cost** | No $120–200/yr proprietary pod refills |
| **Fail-safe around water** | NC valves, module-level safety firmware, layered interlocks |
| **Optional remote alerts** | Meshtastic LoRa — not cloud dependency |

## Scope (MoSCoW)

### Must have (v1)

- Fold-out cart + opaque reservoir tray + grow tent
- 1–2 four-channel irrigation modules on PlantBus
- Home Plant Hub with local web UI
- Manual and automated watering with safety interlocks
- Light schedule via certified smart plug
- Temperature and humidity monitoring with alerts

### Should have (v1)

- Meshtastic stub / optional node for status and critical alerts
- Filter and reservoir maintenance reminders
- Seedling mode and plant mode (deck insert swap)

### Could have (v1.5+)

- Home Assistant integration
- EC/pH read-only sensors
- Cloud-connected tier (Connected SKU)

### Won't have (v1)

See [non-goals](../roadmap/non-goals.md): cloud account, native app, AI diagnosis, ozone, mains auto-fill.

## Positioning statement

**For** home gardeners who start seedlings or overwinter plants indoors, **Plant Ark** is a modular nursery cart **that** automates watering and environment monitoring locally. **Unlike** countertop pod gardens, **Plant Ark** works with your own pots and trays, requires no subscription, and stays under your control on your home network.

## Success (summary)

North star: **≥ 85 % of assigned channels within target moisture band over a 14-day period** without manual intervention. See [success-metrics.md](success-metrics.md).

## Related documents

- [Personas](personas.md)
- [Competitive landscape](competitive-landscape.md)
- [V1 scope](../roadmap/v1-scope.md)
- [Constitution](../constitution.md)
- [Commercialisation](../roadmap/commercialisation.md)
