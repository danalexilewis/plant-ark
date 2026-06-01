# Week 1 — Deep Reading

Role-based reading order after [Day 1](day-1.md). Budget ~1 hour per track.

## Everyone (if not done on Day 1)

1. [Constitution](../../constitution.md)
2. [Glossary](../glossary.md)
3. [Product brief](../../product/product-brief.md)
4. [Risk register](../../risks/risk-register.md) — skim active risks

---

## Hardware / electrical (+ 1 hr)

1. [System architecture](../architecture/system-architecture.md)
2. [Hardware architecture](../architecture/hardware-architecture.md)
3. [Irrigation module](../hardware/irrigation-module.md)
4. [PlantBus physical layer](../protocol/plantbus-physical-layer.md)
5. [Hardware BOM](../references/hardware-bom.md) — **canonical parts list**
6. [Electrical safety](../safety/electrical-safety.md)
7. [Hazard analysis](../../risks/hazard-analysis.md)

---

## Firmware / embedded (+ 1 hr)

1. [PlantBus overview](../protocol/plantbus-overview.md)
2. [PlantBus messages](../protocol/plantbus-messages.md)
3. [Data model](../data-model/entities.md)
4. [Timing and alerting](../references/timing-and-alerting.md)
5. Feature specs:
   - [001 Module discovery](../../specs/001-module-discovery/spec.md)
   - [003 Manual watering](../../specs/003-manual-watering/spec.md)
   - [005 Safety interlocks](../../specs/005-safety-interlocks/spec.md)

---

## Software / full-stack (+ 1 hr)

1. [Software architecture](../architecture/software-architecture.md)
2. [Data model](../data-model/entities.md)
3. Feature specs:
   - [002 Channel/plant assignment](../../specs/002-channel-plant-assignment/spec.md)
   - [004 Automated watering](../../specs/004-automated-watering/spec.md)
   - [006 Alerts and maintenance](../../specs/006-alerts-maintenance/spec.md)
   - [009 Dashboard monitoring](../../specs/009-dashboard-monitoring/spec.md)
4. [Software MVP acceptance](../../acceptance/software-mvp.md)
5. [Traceability matrix](../../acceptance/traceability.md)

---

## Product / design (+ 45 min)

1. [Personas and JTBD](../../product/personas.md)
2. [User journeys](../../product/user-journeys.md)
3. All nine `.feature` files in `specs/` — user-facing behaviour
4. [Competitive landscape](../../product/competitive-landscape.md)
5. [V1 scope](../../roadmap/v1-scope.md) and [Non-goals](../../roadmap/non-goals.md)
6. [Success metrics](../../product/success-metrics.md)

---

## Documentation conventions

### EARS requirements

| Pattern | Example |
|---------|---------|
| Ubiquitous | REQ-SAF-001: The module shall boot with pump off and all valves closed. |
| Event-driven | REQ-DIS-002: When the Hub receives HELLO, the Hub shall register the module. |
| Unwanted | REQ-SAF-003: If leak active, then the module shall stop pump and close valves. |

IDs are never reused. Constitution IDs (`REQ-SAF-M01`) map to spec IDs (`REQ-SAF-001`) via [crosswalk](../safety/safety-requirements.md#constitution-crosswalk).

### Gherkin and sequences

- `.feature` files — Given/When/Then UX scenarios
- `sequence.md` — Mermaid message flows between Hub, module, sensors

### Traceability

Every new `REQ-*` needs a row in [acceptance/traceability.md](../../acceptance/traceability.md).

## Technology stack (implementation phase)

| Layer | Choice |
|-------|--------|
| Hub hardware | Raspberry Pi 4/5 (dev) → CM4 (production) |
| Hub runtime | TypeScript monorepo, Docker Compose |
| UI | React + Vite |
| Database | SQLite |
| Module MCU | ESP32-S3 + SN65HVD230 CAN |
| Module bus | 24V DC + CAN over Cat5e |
| Valves | 12V NC solenoid on 12V rail |

## FAQ

**Is there application code yet?** No — specs first, then implementation after bench validation.

**Can I contribute without hardware?** Yes — `simulator` service fakes modules for Hub/UI development.

**Why CAN not Wi-Fi for modules?** Deterministic, wired, safe near water. See [product brief FAQ](../../product/competitive-landscape.md).

## Next step

→ [First contribution](first-contribution.md)

## Related documents

- [Onboarding hub](../onboarding.md)
