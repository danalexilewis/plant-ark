# Hazard Analysis (FMEA)

Safety hazard log for Plant Ark v1 — water and low-voltage electricity in a home environment.

**Method:** Failure Mode and Effects Analysis (design-level).  
**Controls** reference `REQ-SAF-*` and constitution IDs. See [safety crosswalk](../docs/safety/safety-requirements.md#constitution-crosswalk).

**Severity (S):** 1 negligible → 5 catastrophic (property damage / injury)  
**Occurrence (O):** 1 rare → 5 frequent  
**Detection (D):** 1 almost certain → 5 undetectable  
**RPN** = S × O × D (prioritization only — acceptability uses residual S × O)

## Hazard log

| ID | Hazard | Cause / failure mode | Harm | S | O | D | Controls (REQ) | Residual S | Residual O | Acceptable |
|----|--------|----------------------|------|---|---|---|----------------|------------|------------|------------|
| H-001 | Water leak onto floor | Loose fitting, overflow, cracked tray | Property damage, slip | 4 | 3 | 2 | REQ-SAF-003, REQ-SAF-009, REQ-ALT-001; leak sensor; global block | 2 | 2 | Yes |
| H-002 | Electrical shock | Mains in wet zone | Injury | 5 | 2 | 2 | REQ-SAF-E02, E03, E06; smart plugs only; dry Hub bay | 2 | 1 | Yes |
| H-003 | Pump runs dry / overheats | Reservoir empty, valve closed | Pump damage, heat | 3 | 3 | 2 | REQ-SAF-004, REQ-SAF-M10; level sensor; bypass path | 2 | 2 | Yes |
| H-004 | Valve stuck open | Debris, coil failure | Flood | 4 | 2 | 3 | NC valve fail-closed (REQ-SAF-001); max_duration_ms (REQ-SAF-006); REQ-SAF-M09 | 2 | 2 | Yes |
| H-005 | Uncontrolled watering after Hub crash | Hub software hang | Overwatering, overflow | 3 | 2 | 2 | Module bus timeout (REQ-SAF-002); firmware safe state independent of Hub | 2 | 1 | Yes |
| H-006 | PlantBus miswire | Wrong RJ45 pinout | Destroyed transceiver, fire risk | 5 | 2 | 1 | REQ-SAF-E05 labelling; canonical pinout; fuse + TVS per module | 2 | 1 | Yes |
| H-007 | Stagnant water / biofilm | Infrequent cleaning | Plant disease, odour | 2 | 4 | 3 | REQ-WQ-01–04; REQ-ALT-006 maintenance reminders | 2 | 3 | Yes |
| H-008 | CAN bus failure during watering | Cable fault, termination error | Incomplete dose, valve state unknown | 3 | 2 | 2 | REQ-SAF-002 timeout → safe state; single-valve rule (REQ-SAF-005) | 2 | 1 | Yes |
| H-009 | Pump overcurrent | Blocked filter, seized pump | Heat, smoke | 4 | 2 | 2 | REQ-SAF-011, REQ-ALT-004; 1500 mA threshold | 2 | 1 | Yes |
| H-010 | 24V overcurrent on Cat5e | Too many modules, thin cable | Cable heat | 4 | 2 | 2 | Parallel power pairs; 2A fuse per module; v1 limit 1–2 modules | 2 | 1 | Yes |

## Verification matrix

| Hazard | Verification method | MVP ID |
|--------|---------------------|--------|
| H-001 | Wet test with leak sensor triggered | HW-009, SW-010 |
| H-002 | Inspection — no mains in tray/tent wet zone | HW-003 |
| H-003 | Run pump with level low — command rejected | HW-010 |
| H-004 | Power cycle — valves closed without power | HW-011 |
| H-005 | Disconnect CAN mid-dose — pump stops ≤ 10 s | HW-012 |
| H-006 | Visual inspection of wiring against pinout doc | Bench checklist |
| H-006 | | [electrical-safety.md](../docs/safety/electrical-safety.md) prototype steps |

## Residual risk policy

Residual risks with **S ≥ 4** after controls are **not acceptable** — design must change.  
All listed hazards have residual S ≤ 2 after controls.

## Related documents

- [Risk register](risk-register.md)
- [Safety requirements](../docs/safety/safety-requirements.md)
- [Electrical safety](../docs/safety/electrical-safety.md)
- [Water quality](../docs/safety/water-quality.md)
