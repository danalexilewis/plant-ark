# Water Quality

Water quality strategy for Plant Ark recirculating reservoir systems.

## v1 strategy

No ozone. No open UV-C. Focus on:

- Block light
- Filter particles
- Keep water moving (recirculation during watering)
- Monitor temperature
- Make cleaning easy
- Remind user to maintain system

## Requirements

| ID | Requirement |
|----|-------------|
| REQ-WQ-01 | The reservoir tray shall be opaque to block light. |
| REQ-WQ-02 | Tubing shall be opaque or dark coloured. |
| REQ-WQ-03 | The water path shall be covered (deck covers reservoir during operation). |
| REQ-WQ-04 | The system shall filter via coarse screen, sponge prefilter, and inline mesh filter. |
| REQ-WQ-05 | The system shall provide a drain/flush port. |
| REQ-WQ-06 | The pump/filter cassette shall be removable without tools. |
| REQ-WQ-07 | The system shall monitor water temperature. |
| REQ-WQ-08 | The system shall monitor water level. |
| REQ-WQ-09 | The system shall monitor leak/overflow. |
| REQ-WQ-10 | The Hub shall generate maintenance reminders for filter cleaning and reservoir change. |
| REQ-WQ-11 | The system shall not use ozone in v1. |

## Filtration stack

```
coarse screen → sponge prefilter → pump → inline mesh filter → valve manifold
```

See [pump-filter-cassette.md](../hardware/pump-filter-cassette.md).

## Maintenance schedule

| Task | Frequency | Alert type |
|------|-----------|------------|
| Rinse filter sponge | Weekly | Manual checklist |
| Clean reservoir | Monthly | manual_attention |
| Replace reservoir water | Every 2–4 weeks | manual_attention |
| Replace sponge prefilter | Every 3–6 months | filter_due |
| Inspect for biofilm/algae | Weekly | Visual |

## Temperature guidelines

| Condition | Action |
|-----------|--------|
| Water temp 15–22 °C | Normal for seedlings |
| Water temp > 25 °C | warning water_too_warm alert |
| Water temp < 10 °C | warning — consider heat mat (v1.5) |

## Avoid in v1

- Ozone treatment
- Open UV-C exposure
- Direct mains water connection (auto-fill)
- Complex EC/pH dosing automation

## v1.5 / v2 options

| Feature | Notes |
|---------|-------|
| Air stone / aeration pump | Keeps water oxygenated between watering |
| EC sensor | Nutrient concentration monitoring |
| pH sensor | Acidity monitoring |
| Flow sensor | Per-channel flow verification |
| UV-C inline sterilizer | Enclosed, safe, no open exposure |

## Related documents

- [Reservoir tray](../hardware/reservoir-tray.md)
- [Alerts and maintenance](../../specs/006-alerts-maintenance/spec.md)
- [Constitution](../../constitution.md)
