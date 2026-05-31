# Plant Ark Glossary

Terms and acronyms used across Plant Ark documentation.

| Term | Definition |
|------|------------|
| **Plant Ark** | The product name for the fold-out indoor nursery cart system |
| **Home Plant Hub** | The central controller — discovers modules, runs automation, serves local UI, logs data |
| **PlantBus** | Internal modular bus connecting the Hub to irrigation and environment modules (24V DC + CAN data) |
| **Irrigation module** | A clip-on 4-channel watering unit with pump, filter cassette, valves, and moisture sensors |
| **Environment module** | Optional module for tent sensors and light/fan outputs (v1 keeps this simple) |
| **Channel** | One of four watering outputs on an irrigation module; logical ID format: `{moduleId}/{channelNumber}` |
| **Plant deck** | Removable insert above the reservoir supporting pots, seedling cells, or capillary mats |
| **Reservoir tray** | Opaque drop-in tray holding recirculating water/nutrient solution |
| **Pump/filter cassette** | Removable submerged unit containing pump and filtration stack |
| **Seedling mode** | Tray divided into watering zones; each channel waters a section of seedlings |
| **Plant mode** | Each channel waters one pot |
| **Moisture norm** | Normalized soil moisture reading (0.0–1.0) from a capacitive or resistive sensor |
| **Dose** | A timed watering burst (`doseMs` duration) sent to one channel |
| **Soak wait** | Delay after watering before re-measuring moisture (`soakWaitMinutes`) |
| **Quiet hours** | Time window when automated watering is suppressed unless critical |
| **Global watering lock** | Hub-level mutex ensuring only one module waters at a time |
| **HELLO** | PlantBus message sent by a module on power-up to announce identity |
| **IDENTIFY** | PlantBus command / physical button press to highlight a module in the UI |
| **EARS** | Easy Approach to Requirements Syntax — structured natural-language requirements |
| **CAN** | Controller Area Network — preferred data bus for PlantBus |
| **NC valve** | Normally-closed solenoid valve — closed when de-energised (fail-safe) |
| **Bypass path** | Pump output restrictor returning water to reservoir when valves are closed |
| **Meshtastic** | Optional LoRa mesh network for status summaries and critical alerts |
| **Mesh bridge** | Separate Hub service publishing summaries/alerts to Meshtastic |

## Abbreviations

| Abbr | Meaning |
|------|---------|
| EC | Electrical conductivity (nutrient concentration) — v1.5+ |
| pH | Acidity/alkalinity — v1.5+ |
| MCU | Microcontroller unit (on irrigation module) |
| UI | Local web dashboard served by the Hub |
| MVP | Minimum viable product (software and hardware acceptance criteria) |
| SDD | Spec-driven development |

## Related documents

- [Constitution](../constitution.md)
- [System architecture](architecture/system-architecture.md)
- [PlantBus overview](protocol/plantbus-overview.md)
