# Plant Ark Constitution

Non-negotiable principles for all Plant Ark specifications, hardware, and software. Every feature spec must conform to this document.

## Product identity

Plant Ark is a **practical gardening appliance**, not lab equipment or a sci-fi hydroponics machine. The aesthetic is camping-cart meets self-watering seedling tray meets mini grow tent — repairable, modular, and friendly.

## Core principles

| ID | Principle | Implication |
|----|-----------|-------------|
| PRIN-01 | Practical and repairable | Modules clip on/off; pump/filter cassette removes without tools |
| PRIN-02 | Modular | Same cart, tray, controller, and modules support seedling mode and plant mode |
| PRIN-03 | No cloud dependency required | Hub runs locally; all core functions work offline |
| PRIN-04 | Local-first control and logging | Data stays on the hub; optional Meshtastic for status/alerts only |
| PRIN-05 | Safe around water and electricity | Low-voltage DC for modules; mains AC stays outside wet areas |
| PRIN-06 | Easy to clean | Opaque reservoir, removable deck, rinseable filter cassette |
| PRIN-07 | Fail safe | Power off = valves closed; bus timeout = pump off, valves closed |
| PRIN-08 | Light-protected water | Opaque tray, dark tubing, no grow-light exposure to standing water |
| PRIN-09 | Simple automation first | Rule-based watering before "smart" plant intelligence |
| PRIN-10 | Meshtastic is optional | Status summaries and critical alerts only — not full telemetry |

## Safety non-negotiables

### Module-level

- REQ-SAF-M01 (Ubiquitous): The irrigation module shall boot with pump off and all valves closed.
- REQ-SAF-M02 (Unwanted): If the bus communication timeout exceeds the configured limit, then the module shall stop the pump and close all valves.
- REQ-SAF-M03 (Unwanted): If the leak sensor reports active, then the module shall stop the pump and close all valves.
- REQ-SAF-M04 (Unwanted): If the water level sensor reports low, then the module shall reject watering commands.
- REQ-SAF-M05 (Ubiquitous): The module shall never open more than one valve at a time.
- REQ-SAF-M06 (Ubiquitous): The module shall never run the pump longer than `max_duration_ms` on any command.
- REQ-SAF-M07 (Ubiquitous): The module shall reject duplicate command IDs.

### Hub-level

- REQ-SAF-H01 (Ubiquitous): The Hub shall allow only one module to water at a time by default.
- REQ-SAF-H02 (Unwanted): If any module reports a leak, then the Hub shall block all watering globally.
- REQ-SAF-H03 (Unwanted): If the reservoir level is low, then the Hub shall block all watering globally.
- REQ-SAF-H04 (Unwanted): If a module is offline, then the Hub shall block watering for that module's channels.

### Electrical

- REQ-SAF-E01 (Ubiquitous): Plant modules shall operate on low-voltage DC (24V) only.
- REQ-SAF-E02 (Ubiquitous): Mains AC wiring shall not enter the tray, tent, or module wet zones.
- REQ-SAF-E03 (Ubiquitous): Grow light and fan mains control shall use certified smart plugs or properly enclosed relay modules.

## Water quality non-negotiables

- REQ-WQ-01 (Ubiquitous): The reservoir tray shall be opaque to block light.
- REQ-WQ-02 (Ubiquitous): The system shall filter particles via coarse screen, sponge prefilter, and inline mesh filter.
- REQ-WQ-03 (Ubiquitous): The system shall monitor water temperature and reservoir level.
- REQ-WQ-04 (Ubiquitous): The system shall not use ozone in v1.

## Non-goals for v1

Do not specify or implement these in v1:

- Cloud account system
- Mobile native app
- AI plant diagnosis
- Camera / computer vision
- Ozone treatment
- Full hydroponic nutrient automation (EC/pH dosing)
- Mains water connection
- Mains wiring inside custom wet enclosure
- Full product-grade PCB before bench prototype
- Full CAD perfection before water test

## Spec authoring rules

1. Every requirement uses **EARS notation** with a stable `REQ-*` ID.
2. Every user-facing capability has a **Gherkin `.feature`** file.
3. Every computational workflow has a **mermaid sequence diagram**.
4. Every `REQ-*` ID appears in `acceptance/traceability.md`.
5. Open design questions record the brief's preferred answer unless superseded by a decision record.

## Technology preferences (for future implementation)

These guide implementation specs but are not binding on the documentation build:

| Layer | Preferred choice |
|-------|------------------|
| Hub runtime | Linux (Raspberry Pi 4/5 or mini PC) |
| Hub software | TypeScript monorepo, Docker Compose |
| API | Fastify or Express |
| UI | React + Vite, mobile-friendly |
| Database | SQLite |
| Schemas | Zod |
| Module bus | 24V DC + CAN over Cat5/Cat6 (NOT Ethernet protocol) |
| Module pump | One 12V DC brushless submersible pump per 4-channel module |
| Module valves | Normally-closed solenoid valves |

## Related documents

- [Glossary](docs/glossary.md)
- [System architecture](docs/architecture/system-architecture.md)
- [Safety requirements](docs/safety/safety-requirements.md)
- [Non-goals](roadmap/non-goals.md)
