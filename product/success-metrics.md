# Success Metrics

How we know Plant Ark is working for users and viable as a product.

## North star metric

**Channel moisture success rate (CMSR):** percentage of assigned, enabled channels whose `moisture_norm` is within `[targetMoistureMin, targetMoistureMax]` at each automation evaluation, averaged over 14 days.

| Target | Phase |
|--------|-------|
| ≥ 85 % CMSR | v1 bench prototype with real plants |
| ≥ 90 % CMSR | v1 beta (10–20 user kits) |
| ≥ 92 % CMSR | Retail launch |

CMSR directly measures whether the core job — keep plants watered correctly — is done.

## Supporting product metrics

| Metric | Definition | v1 target | Links to |
|--------|------------|-----------|----------|
| Setup completion rate | % of users reaching first manual water within 24 h of unboxing | ≥ 80 % | [Journey 1](user-journeys.md) |
| Manual interventions per week | Operator-initiated manual waters outside automation | ≤ 3 per 8 channels | Automation quality |
| Alert MTTR | Mean time from critical alert to acknowledged | ≤ 30 min (when operator present) | [Journey 3](user-journeys.md) |
| Leak incidents without auto-stop | Count of leaks where pump ran > 5 s after detection | **0** | REQ-SAF-003 |
| Module uptime | % of time modules online when Hub powered | ≥ 99 % | REQ-DIS-010 |
| Automation skip rate | % of evaluation cycles that skip due to safety | Track; no fixed target — diagnostic | REQ-AUT-009 logs |

## Software MVP metrics

| MVP ID | Metric | Pass |
|--------|--------|------|
| SW-008 | Automation triggers on dry channel | ≥ 1 successful auto dose in simulator test |
| SW-010 | Leak blocks watering | 100 % block rate in test |
| SW-011 | Low reservoir blocks watering | 100 % block rate in test |

See [software MVP acceptance](../acceptance/software-mvp.md).

## Hardware MVP metrics

| MVP ID | Metric | Pass |
|--------|--------|------|
| HW-011 | Safe boot state | Pump off, valves closed on every power cycle (n ≥ 10) |
| HW-012 | Bus timeout safe state | Safe state within 10 s of CAN loss |
| HW-015 | End-to-end manual water | UI → module → water delivered → moisture changes |

See [hardware MVP acceptance](../acceptance/hardware-mvp.md).

## Commercial KPIs (linked)

From [commercialisation plan](../roadmap/commercialisation.md):

| KPI | Target |
|-----|--------|
| Starter kit COGS (100 units) | ~$213 |
| Starter kit retail | $350–450 |
| Gross margin | ~47 % at $400 |
| Beta NPS | ≥ 40 before retail launch |

## Measurement approach

| Phase | Method |
|-------|--------|
| Spec / simulator | Automated tests against Gherkin; SQLite query of moisture logs |
| Bench prototype | Data logged to Hub SQLite; weekly CMSR spreadsheet |
| Beta | Anonymous aggregate telemetry opt-in on Connected tier (future); otherwise user survey |

## Related documents

- [Product brief](product-brief.md)
- [Non-functional requirements](non-functional-requirements.md)
- [Traceability matrix](../acceptance/traceability.md)
