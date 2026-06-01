# Component Catalog

Reference component **classes** and selection criteria for Plant Ark v1. This document describes *what kinds of parts* the system needs and why.

**For specific SKUs, pricing, GPIO assignments, and wiring diagrams, use the canonical [Hardware BOM](hardware-bom.md).** When the catalog and BOM disagree, the BOM wins for prototype builds.

## Irrigation module components

| Component class | Selection criteria | Qty per module | Notes |
|-----------------|-------------------|----------------|-------|
| MCU | ESP32-S3 (dev) / ESP32-S3-WROOM (production); CAN via SN65HVD230 | 1 | Local safety firmware — see BOM |
| CAN transceiver | ISO 11898 compatible (e.g. TJA1050, MCP2551) | 1 | 3.3V or 5V logic |
| 12V brushless submersible pump | 200–400 L/h, quiet, 12V DC | 1 | In filter cassette |
| NC solenoid valve | 12V DC normally closed (v1 prototype); food-safe wetted materials preferred | 4 | One per channel — see [Hardware BOM](hardware-bom.md) for U.S. Solid USS2-00005 |
| Moisture sensor | Capacitive soil moisture sensor with analog output | 4 | One per channel |
| Water level sensor | Float switch or capacitive level sensor | 1 | Low-level detection |
| Leak sensor | Conductive leak detection pad or rope sensor | 1 | Under-tray or module base |
| Water temperature sensor | DS18B20 or NTC thermistor | 1 | In reservoir |
| Pump current sensor | Inline shunt or ACS712 hall sensor | 1 | Pump health monitoring |
| 12V DC regulator | Buck converter, 24V→12V, ≥2A | 1 | Pump power |
| Valve driver | N-channel MOSFET + flyback diode ×4 | 4 | Low-side switch |
| Identify button | Tactile push button | 1 | Module identification |
| Status LED | Bi-colour or RGB LED | 1 | Module status |
| Fuse | 2A slow-blow on 24V input | 1 | Per module |
| TVS diode | 24V bidirectional TVS on power input | 1 | Per module |
| ESD protection | On CAN-H/L lines | 1 set | Per module |

## PlantBus cabling

| Component class | Selection criteria | Qty | Notes |
|-----------------|-------------------|-----|-------|
| Cat5e/Cat6 cable | Solid or stranded, outdoor-rated optional | As needed | Physical layer only — NOT Ethernet |
| RJ45 connectors | 8P8C, shielded optional | Per cable end | Prototype connector |
| M12 A-coded 5-pin | IP67, panel mount | Future production | +24V, GND, CAN-H, CAN-L, shield |
| 120 Ω termination resistor | 1/4W through-hole or SMD | 2 | One at each bus end |
| Cable labels | "PLANTBUS — NOT ETHERNET" | All connectors | Mandatory |

## Hub components

| Component class | Selection criteria | Qty | Notes |
|-----------------|-------------------|-----|-------|
| Single-board computer | Raspberry Pi 4/5 or mini PC | 1 | Linux host |
| USB-CAN adapter | SocketCAN compatible (e.g. CANable, PEAK) | 1 | PlantBus interface |
| 24V DC power supply | Mean Well or equivalent, ≥5A, UL/CE certified | 1 | Module bus power |
| Certified smart plug | Wi-Fi or Zigbee, Hub-controllable | 1–2 | Grow light + fan |
| Optional Meshtastic device | T-Beam, Heltec, or similar | 0–1 | LoRa alerts |

## Mechanical / structural

| Component class | Selection criteria | Qty | Notes |
|-----------------|-------------------|-----|-------|
| Folding cart frame | Camping cart or custom weldment, ≥30 kg capacity | 1 | Powder-coated steel/aluminium |
| Locking casters | 75–100 mm, soft wheel | 4 | Indoor use |
| Reservoir tray | HDPE/PP opaque, ~600×800 mm | 1 | Food-safe preferred |
| Grow tent | Reflective mylar, sized to frame | 1 | Standard grow tent or custom |
| LED grow light bar | Full-spectrum, 30–50W, 60 cm | 1 | Via certified plug |
| Drip tubing | 4–6 mm LDPE, opaque/black | 4× length | Per channel |
| Drip emitters | Adjustable 0–40 L/h | 4 | Plant mode |
| Barbed fittings | Match tubing ID | As needed | |
| Sponge prefilter | Aquarium filter sponge block | 1 per module | Cassette |
| Inline mesh filter | 200 mesh stainless or nylon | 1 per module | After pump |

## Environment sensors (v1 simple)

| Component class | Selection criteria | Qty | Notes |
|-----------------|-------------------|-----|-------|
| Air temperature / humidity | BME280 or SHT31 I2C | 1 | In tent |
| Light level sensor | BH1750 or TSL2561 | 1 | Optional |
| Inline fan | 120 mm duct fan via certified plug | 0–1 | Manual/scheduled v1 |

## Excluded from v1

| Component | Reason |
|-----------|--------|
| EC sensor | v1.5+ |
| pH sensor | v1.5+ |
| Flow sensor | v1.5+ |
| UV-C sterilizer | v2 |
| Ozone generator | Non-goal |
| Peristaltic dosing pump | v2 precision variant |
| Latching solenoid valves | v2 low-power variant |

## Related documents

- [Hardware BOM](hardware-bom.md) — **canonical prototype parts list**
- [Irrigation module](../hardware/irrigation-module.md)
- [Pump/filter cassette](../hardware/pump-filter-cassette.md)
- [PlantBus physical layer](../protocol/plantbus-physical-layer.md)
- [External standards](external-standards.md)
