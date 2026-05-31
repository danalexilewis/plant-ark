# Plant Ark

A modular fold-out indoor nursery cart for overwintering plants, starting seedlings, and running a small controlled grow environment at home.

> **Unfold the cart, drop in the tray, add the tent, clip in the modules, and run a small indoor nursery with reliable watering, lighting, monitoring, and local control.**

This repository is a **spec-driven development (SDD)** project. The current deliverable is documentation — references, acceptance criteria, UX flows, and workflow diagrams — not application code.

## Documentation status

| Package | Content | Status |
|---------|---------|--------|
| 1 | Scaffold, constitution, glossary, templates | Complete |
| 2 | Architecture references | Complete |
| 3 | Hardware refs (cart, tray, deck, tent) | Complete |
| 4 | Hardware refs (irrigation module) | Complete |
| 5 | PlantBus protocol | Complete |
| 6 | Data model | Complete |
| 7 | Feature specs 001–005 (watering core) | Complete |
| 8 | Feature specs 006–009 (env, mesh, UI) | Complete |
| 9 | Safety + acceptance criteria | Complete |
| 10 | Traceability + roadmap | Complete |

## Quick navigation

### Principles and governance

- [Constitution](constitution.md) — non-negotiable principles, safety rules, non-goals
- [Glossary](docs/glossary.md) — terms and acronyms

### Reference library (`docs/`)

| Area | Documents |
|------|-----------|
| Architecture | [System](docs/architecture/system-architecture.md) · [Software](docs/architecture/software-architecture.md) · [Hardware](docs/architecture/hardware-architecture.md) |
| Hardware | [Cart frame](docs/hardware/cart-frame.md) · [Reservoir tray](docs/hardware/reservoir-tray.md) · [Plant deck](docs/hardware/plant-deck.md) · [Grow tent](docs/hardware/grow-tent.md) · [Irrigation module](docs/hardware/irrigation-module.md) · [Pump/filter cassette](docs/hardware/pump-filter-cassette.md) · [Valves manifold](docs/hardware/valves-manifold.md) |
| Protocol | [PlantBus overview](docs/protocol/plantbus-overview.md) · [Physical layer](docs/protocol/plantbus-physical-layer.md) · [Messages](docs/protocol/plantbus-messages.md) |
| Data model | [Entities](docs/data-model/entities.md) |
| Safety | [Safety requirements](docs/safety/safety-requirements.md) · [Electrical](docs/safety/electrical-safety.md) · [Water quality](docs/safety/water-quality.md) |
| Integrations | [Meshtastic](docs/integrations/meshtastic.md) |
| References | [Component catalog](docs/references/component-catalog.md) · [External standards](docs/references/external-standards.md) |

### Feature specs (`specs/`)

See [specs/README.md](specs/README.md) for the full feature index.

| ID | Feature | Spec | Gherkin | Sequence |
|----|---------|------|---------|----------|
| 001 | Module discovery | [spec](specs/001-module-discovery/spec.md) | [feature](specs/001-module-discovery/module-discovery.feature) | [sequence](specs/001-module-discovery/sequence.md) |
| 002 | Channel / plant assignment | [spec](specs/002-channel-plant-assignment/spec.md) | [feature](specs/002-channel-plant-assignment/channel-plant-assignment.feature) | [sequence](specs/002-channel-plant-assignment/sequence.md) |
| 003 | Manual watering | [spec](specs/003-manual-watering/spec.md) | [feature](specs/003-manual-watering/manual-watering.feature) | [sequence](specs/003-manual-watering/sequence.md) |
| 004 | Automated watering | [spec](specs/004-automated-watering/spec.md) | [feature](specs/004-automated-watering/automated-watering.feature) | [sequence](specs/004-automated-watering/sequence.md) |
| 005 | Safety interlocks | [spec](specs/005-safety-interlocks/spec.md) | [feature](specs/005-safety-interlocks/safety-interlocks.feature) | [sequence](specs/005-safety-interlocks/sequence.md) |
| 006 | Alerts and maintenance | [spec](specs/006-alerts-maintenance/spec.md) | [feature](specs/006-alerts-maintenance/alerts-maintenance.feature) | [sequence](specs/006-alerts-maintenance/sequence.md) |
| 007 | Environment and light control | [spec](specs/007-environment-light-control/spec.md) | [feature](specs/007-environment-light-control/environment-light-control.feature) | [sequence](specs/007-environment-light-control/sequence.md) |
| 008 | Meshtastic status and alerts | [spec](specs/008-meshtastic-status-alerts/spec.md) | [feature](specs/008-meshtastic-status-alerts/meshtastic-status-alerts.feature) | [sequence](specs/008-meshtastic-status-alerts/sequence.md) |
| 009 | Dashboard monitoring | [spec](specs/009-dashboard-monitoring/spec.md) | [feature](specs/009-dashboard-monitoring/dashboard-monitoring.feature) | [sequence](specs/009-dashboard-monitoring/sequence.md) |

### Acceptance and roadmap

- [Software MVP acceptance](acceptance/software-mvp.md)
- [Hardware MVP acceptance](acceptance/hardware-mvp.md)
- [Traceability matrix](acceptance/traceability.md)
- [V1 scope](roadmap/v1-scope.md) · [Open questions](roadmap/open-questions.md) · [Non-goals](roadmap/non-goals.md) · [Future](roadmap/future.md)

## Methodology

This project follows lightweight spec-driven development:

- **Constitution** — non-negotiable principles ([constitution.md](constitution.md))
- **Reference docs** — what the system *is* (`docs/`)
- **Feature specs** — how the system *behaves* (`specs/`), each with:
  - `spec.md` — EARS requirements
  - `*.feature` — Gherkin UX flows
  - `sequence.md` — mermaid workflow diagrams
- **Acceptance** — testable MVP criteria (`acceptance/`)
- **Templates** — authoring conventions (`templates/`)

Inspired by [GitHub Spec Kit](https://github.com/github/spec-kit) conventions; no CLI tooling required for the documentation phase.

## Product summary

Plant Ark combines:

- Fold-out wheeled cart frame
- Drop-in opaque recirculating reservoir tray
- Removable plant deck / seedling insert
- Soft reflective grow tent
- LED grow light support
- Clip-on 4-channel irrigation modules (PlantBus)
- Central Home Plant Hub (local-first)
- Optional Meshtastic telemetry and alerts

**Modes:** Seedling mode (zone watering) and plant mode (one channel per pot) using the same hardware with different deck inserts and tubing layouts.

**Technical one-liner:** A local-first modular plant-care platform using 24V PlantBus, 4-channel irrigation modules, recirculating tray reservoirs, and optional Meshtastic alerts.
