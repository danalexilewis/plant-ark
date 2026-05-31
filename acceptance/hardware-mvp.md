# Hardware MVP Acceptance Criteria

Testable acceptance criteria for the first Plant Ark hardware bench prototype.

## Overview

The hardware MVP is acceptable when one 4-channel irrigation module operates safely on a bench setup with reservoir tray, watering four pots/zones with recirculating runoff.

## Bench setup

| Component | Required |
|-----------|----------|
| 4-channel irrigation module (bench prototype) | 1 |
| Opaque reservoir tray (or test tank) | 1 |
| Plant deck or test platform | 1 |
| Home Plant Hub with USB-CAN adapter | 1 |
| 24V DC power supply | 1 |
| 4× moisture sensors | 4 |
| 4× drip lines with emitters | 4 |
| Leak sensor pad | 1 |
| Water level sensor | 1 |

Full cart, tent, and grow light are not required for hardware MVP acceptance (those are v1 product prototype).

## Criteria (EARS)

### Mechanical

- REQ-MVP-HW-001 (Ubiquitous): The module shall clip to the tray edge rail without tools.
- REQ-MVP-HW-002 (Ubiquitous): The pump/filter cassette shall be removable and reinsertable without tools.
- REQ-MVP-HW-003 (Ubiquitous): The dry electronics bay shall remain above the splash line during operation.

### Water system

- REQ-MVP-HW-004 (Event-driven): When a WATER command is sent, the module shall deliver water to the selected channel drip output.
- REQ-MVP-HW-005 (Ubiquitous): Runoff from all 4 channels shall drain back to the reservoir.
- REQ-MVP-HW-006 (Ubiquitous): The pump shall draw recirculating water from the reservoir through the filter cassette.

### Sensing

- REQ-MVP-HW-007 (Event-driven): When SENSOR_REPORT is requested, the module shall report 4 moisture readings.
- REQ-MVP-HW-008 (Event-driven): When water level is low, the module shall report water_level low in SENSOR_REPORT.

### Safety

- REQ-MVP-HW-009 (Unwanted): If the leak sensor is triggered, then the module shall stop the pump and reject further watering commands.
- REQ-MVP-HW-010 (Unwanted): If water level is low, then the module shall reject watering commands.
- REQ-MVP-HW-011 (Ubiquitous): On power cycle, the module shall boot with pump off and all valves closed.
- REQ-MVP-HW-012 (Unwanted): If bus communication is lost for 10 seconds during watering, then the module shall stop the pump and close valves.

### Hub integration

- REQ-MVP-HW-013 (Event-driven): When the module powers on, the Hub shall register it via HELLO within 10 seconds.
- REQ-MVP-HW-014 (Event-driven): When the operator presses the identify button, the Hub UI shall highlight the module.
- REQ-MVP-HW-015 (Event-driven): When the operator triggers manual water from the UI, the module shall execute the watering sequence and report water_complete.

## Verification procedure

1. **Safe boot test:** Power on module → verify pump off, valves closed, HELLO received
2. **Identify test:** Press identify button → verify UI highlight
3. **Single channel water test:** Manual water channel 1 → verify drip output, pump stops, valve closes, event logged
4. **Sequential multi-channel test:** Water channels 1–4 in sequence → verify no concurrent valves open
5. **Recirculation test:** Run 10 cycles → verify water returns to reservoir, level stable
6. **Cassette removal test:** Remove cassette mid-idle → reinsert → verify normal operation
7. **Leak test:** Trigger leak sensor → verify pump stops, Hub blocks watering, alert raised
8. **Low level test:** Lower water below sensor → verify watering rejected
9. **Bus timeout test:** Disconnect CAN during watering → verify pump stops within 10 seconds
10. **Moisture report test:** Verify 4 moisture values in SENSOR_REPORT match physical conditions

## Related documents

- [Software MVP acceptance](software-mvp.md)
- [Irrigation module](../docs/hardware/irrigation-module.md)
- [Safety requirements](../docs/safety/safety-requirements.md)
- [Electrical safety](../docs/safety/electrical-safety.md)
