# Risk Register

Project, technical, supply-chain, and product-market risks for Plant Ark v1.

**Last reviewed:** 2026-06-01  
**Scoring:** Likelihood (1–5) × Impact (1–5) = Score. See [README](README.md).

## Active risks

| ID | Category | Risk | L | I | Score | Mitigation | Owner | Status |
|----|----------|------|---|---|-------|------------|-------|--------|
| R-T-001 | Technical | PlantBus RJ45 miswire (24V on CAN transceiver) | 3 | 5 | 15 | Canonical pinout in [physical layer](../docs/protocol/plantbus-physical-layer.md); label all cables NOT ETHERNET | Hardware | Mitigated |
| R-T-002 | Technical | Cat5e 24V current insufficient at 5 modules | 2 | 4 | 8 | Parallel +24V/GND pairs; power budget in [plantbus-overview](../docs/protocol/plantbus-overview.md); v1 limits 1–2 modules | Hardware | Open |
| R-T-003 | Technical | Seedling watering method undecided (Q4) | 4 | 3 | 12 | Prototype test plan in [open questions](../roadmap/open-questions.md); document in seedling-watering-test.md | Hardware | Open |
| R-T-004 | Technical | 3D-printed module housing not watertight | 3 | 4 | 12 | Splash guard design; dry bay above splash line (REQ-HW-IM-003); bench leak test before cart integration | Hardware | Open |
| R-T-005 | Technical | ESP32 GPIO map still placeholder in BOM | 3 | 3 | 9 | Finalize pins before PCB layout; document in BOM v2 | Firmware | Open |
| R-S-001 | Supply | Raspberry Pi / CM4 availability or EOL | 2 | 4 | 8 | CM4 on commitment to 2034; mini PC fallback in component catalog | Hardware | Monitor |
| R-S-002 | Supply | U.S. Solid valve SKU discontinued | 2 | 3 | 6 | Identify 2 alternate 12V NC valves; test before production run | Hardware | Open |
| R-S-003 | Supply | Long lead times on AliExpress parts | 3 | 2 | 6 | Order critical path parts early; Amazon fallback for dev kits | Project | Open |
| R-P-001 | Project | Scope creep into cloud/app/AI before bench valid | 4 | 3 | 12 | [Non-goals](../roadmap/non-goals.md); constitution v1 exclusions; gate on HW MVP | Project | Open |
| R-P-002 | Project | Single-maintainer bus factor | 3 | 4 | 12 | Onboarding docs; simulator for software-only contribution; good-first-task in onboarding | Project | Mitigated |
| R-P-003 | Project | Spec/code drift during implementation | 3 | 3 | 9 | Traceability matrix; REQ ID crosswalk; spec change process in onboarding | Software | Mitigated |
| R-PM-001 | Product | DIY perception — "just parts in a cart" | 4 | 3 | 12 | Product layer docs; competitive positioning; polished UX on hub-ui | Product | Mitigated |
| R-PM-002 | Product | Assembly too hard for non-makers | 3 | 4 | 12 | Target ≤ 90 min setup (NFR-SETUP-001); quick-start guide at retail | Product | Open |
| R-PM-003 | Product | Countertop incumbents "good enough" for herbs | 3 | 3 | 9 | Target seedling/overwinter niche; CMSR north star metric | Product | Open |
| R-C-001 | Commercial | CE/UL certification cost over budget | 2 | 4 | 8 | Pre-compliance at Stage 4; ESP32/CM4 pre-certified RF modules | Commercial | Open |
| R-C-002 | Commercial | COGS exceeds retail price band | 2 | 5 | 10 | Production BOM at 100 units (~$213); margin model in [commercialisation](../roadmap/commercialisation.md) | Commercial | Monitor |

## Closed / mitigated log

| ID | Resolution | Date |
|----|------------|------|
| R-T-001 | Pinout unified across physical-layer, BOM, onboarding (2026-06-01) | 2026-06-01 |
| R-P-002 | Progressive onboarding + first-contribution guide added | 2026-06-01 |
| R-P-003 | Safety ID crosswalk + timing reference doc added | 2026-06-01 |
| R-PM-001 | product/ directory with brief, personas, competitive analysis | 2026-06-01 |

## Escalation triggers

- Any **critical** hazard with unacceptable residual risk → stop water testing
- Score **≥ 15** on any new risk → review before next sprint/milestone
- Two **high** supply risks active simultaneously → reorder critical path BOM

## Related documents

- [Hazard analysis](hazard-analysis.md)
- [Open questions](../roadmap/open-questions.md)
- [Hardware MVP acceptance](../acceptance/hardware-mvp.md)
