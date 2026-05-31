# Open Design Questions

Design questions from the Plant Ark brief with recorded preferred answers for v1.

| # | Question | Preferred answer (v1) | Alternative | Status |
|---|----------|----------------------|-------------|--------|
| 1 | CAN or RS-485 for PlantBus? | **CAN** — modular discovery, noise immunity | RS-485 if CAN tooling unavailable | Decided |
| 2 | One pump + four valves, or four pumps? | **One pump + four NC solenoid valves** | Four small pumps (no valves) | Decided |
| 3 | One reservoir for whole cart or per shelf? | **One reservoir per tray/shelf** | One giant whole-tent reservoir | Decided |
| 4 | Seedling mode: drippers or capillary strips? | **Test both** — likely capillary/flood strips for seedlings, drippers for pots | Drippers only | Open — test during prototype |
| 5 | Light control approach? | **Schedule via certified smart plug** (v1) | Direct dimming (v2) | Decided for v1 |
| 6 | Meshtastic integration location? | **Separate mesh-bridge service** | Integrated in hub-api | Decided |
| 7 | PlantBus connector for prototype? | **RJ45 on Cat5/Cat6** (labelled NOT ETHERNET) | M12 from start | Decided — M12 for production |
| 8 | Message encoding for early dev? | **JSON** (simulator + early software) | Binary from day one | Decided — binary for production firmware |
| 9 | Hub hardware? | **Raspberry Pi 4/5** or mini PC | Dedicated embedded board | Decided |
| 10 | Software stack? | **TypeScript monorepo** | Python services | Decided |

## Questions requiring prototype testing

### Seedling watering method (Q4)

Test plan:

1. Build seedling tray insert with 4 zones
2. Test A: drip bar per zone (4 channel drippers)
3. Test B: capillary mat with flood strip per zone
4. Measure: uniformity of moisture across cells, speed of wetting, dry-back rate
5. Decision criteria: most uniform moisture with least over-watering

Document results in a future `docs/references/seedling-watering-test.md` when prototype exists.

## Related documents

- [V1 scope](v1-scope.md)
- [Future](future.md)
- [PlantBus overview](../docs/protocol/plantbus-overview.md)
