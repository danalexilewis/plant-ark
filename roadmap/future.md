# Future Roadmap

Planned capabilities beyond v1, ordered by likely delivery phase.

## v1.5 — Enhanced monitoring

| Feature | Description |
|---------|-------------|
| Air stone / aeration pump | Keeps reservoir water oxygenated between watering cycles |
| EC sensor | Nutrient concentration monitoring (read-only, no dosing) |
| pH sensor | Acidity monitoring (read-only, no dosing) |
| Flow sensor | Verify water delivery per channel |
| Second irrigation module | Expand to 8 channels |
| Home Assistant integration | MQTT discovery for sensors and switches |

## v2 — Precision and scale

| Feature | Description |
|---------|-------------|
| Peristaltic dosing module | Precision nutrient dosing (separate module type) |
| Light dimming | PWM or certified dimmable driver |
| Fan speed control | Variable speed via certified controller |
| Heat mat control | Scheduled/on-demand via smart plug |
| UV-C inline sterilizer | Enclosed loop, no open exposure |
| Multi-shelf cart | One reservoir per shelf |
| M12 PlantBus connectors | Replace RJ45 prototype connectors |
| Binary PlantBus encoding | Production firmware message format |
| OTA firmware updates | Module firmware over PlantBus |
| Up to 5 modules | 20 plants/zones total |

## v3 — Productisation

| Feature | Description |
|---------|-------------|
| Custom PCB production | Module and environment module PCBs |
| Injection-molded tray and deck | Production plastics |
| CE/UL certification | Commercial product safety |
| Mobile app (optional) | Remote via Meshtastic, not cloud |
| AI-assisted scheduling | Learns from moisture patterns (local only) |
| Latching valve variant | Battery/solar module option |

## Seedling watering resolution (from open questions)

When prototype testing completes for drippers vs capillary strips:

- Document in `docs/references/seedling-watering-test.md`
- Update [plant deck](../docs/hardware/plant-deck.md) recommendation
- Update default channel mode configuration in automation engine

## Related documents

- [V1 scope](v1-scope.md)
- [Open questions](open-questions.md)
- [Non-goals](non-goals.md)
