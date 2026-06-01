# User Journeys

End-to-end flows for primary personas. Each journey links to feature specs and acceptance criteria.

## Journey 1: First-run commissioning

**Persona:** Seedling Starter or Overwinterer  
**Goal:** From boxed parts to first successful automated watering  
**Target time:** ≤ 90 minutes (see [NFR-SETUP-001](non-functional-requirements.md))

| Step | User action | System response | Spec / doc |
|------|-------------|-----------------|------------|
| 1 | Unfold cart, lock casters | — | [cart-frame.md](../docs/hardware/cart-frame.md) |
| 2 | Drop reservoir tray in | Tray seated, opaque | [reservoir-tray.md](../docs/hardware/reservoir-tray.md) |
| 3 | Install plant deck (seedling or pot insert) | — | [plant-deck.md](../docs/hardware/plant-deck.md) |
| 4 | Fill reservoir with water | Level OK reported when float triggers | REQ-SAF-004 |
| 5 | Clip 1–2 irrigation modules on tray rim | Modules power from PlantBus | [irrigation-module.md](../docs/hardware/irrigation-module.md) |
| 6 | Route drip lines to zones/pots | — | [valves-manifold.md](../docs/hardware/valves-manifold.md) |
| 7 | Install grow tent and light bar | — | [grow-tent.md](../docs/hardware/grow-tent.md) |
| 8 | Connect PlantBus cables Hub → modules | Labelled NOT ETHERNET | [plantbus-physical-layer.md](../docs/protocol/plantbus-physical-layer.md) |
| 9 | Power on Hub | Modules send HELLO; appear in UI | [001-module-discovery](../specs/001-module-discovery/spec.md) |
| 10 | Name modules; press Identify to confirm | LED blink; UI highlights module | REQ-DIS-008 |
| 11 | Create plant profiles; assign to channels | Profiles persisted | [002-channel-plant-assignment](../specs/002-channel-plant-assignment/spec.md) |
| 12 | Set light schedule on smart plug | Light on/off at configured times | [007-environment-light-control](../specs/007-environment-light-control/spec.md) |
| 13 | Run manual "Water now" on one channel | Dose completes; event logged | [003-manual-watering](../specs/003-manual-watering/spec.md) |
| 14 | Enable automation | Engine evaluates every 15 min | [004-automated-watering](../specs/004-automated-watering/spec.md) |

**Success criteria:** Operator sees system status **ok** on dashboard; one manual water and one automated cycle logged without errors.

---

## Journey 2: Daily check-in

**Persona:** Overwinterer  
**Goal:** Confirm nursery is healthy in under 2 minutes  
**Frequency:** Daily

| Step | User action | System response |
|------|-------------|-----------------|
| 1 | Open dashboard on phone (same WiFi) | Loads within 3 s (NFR-PERF-001) |
| 2 | Glance system status | ok / warning / critical per [timing rules](../docs/references/timing-and-alerting.md) |
| 3 | Check needs-water list | Channels below targetMoistureMin highlighted |
| 4 | Acknowledge any warning alerts | Alert marked acknowledged |
| 5 | Top up reservoir if low | Level returns OK; watering unblocks |

**Failure branch:** If status is **warning** (module offline), operator checks PlantBus cable and module power before acknowledging.

---

## Journey 3: Incident — leak detected

**Persona:** Any operator  
**Goal:** Stop damage, dry tray, resume safely

| Step | User action | System response |
|------|-------------|-----------------|
| 1 | Leak sensor triggers | Module stops pump; valves close (REQ-SAF-003) |
| 2 | — | Hub blocks all watering globally (REQ-SAF-009) |
| 3 | — | Critical leak_detected alert on dashboard (REQ-ALT-001) |
| 4 | — | Optional Meshtastic critical packet within 60 s |
| 5 | Operator acknowledges alert; dries tray area | — |
| 6 | Operator fixes cause (loose fitting, overflow) | — |
| 7 | Operator clears leak condition in UI when dry | Module reports leak inactive |
| 8 | Operator runs manual test dose on one channel | Verifies flow before re-enabling automation |

**Must never happen:** Pump continues running after leak detected.

---

## Journey 4: Seasonal transition — seedling to plant mode

**Persona:** Seedling Starter → Overwinterer  
**Goal:** Repurpose same hardware for potted plants after seedlings transplant outdoors

| Step | User action | System response |
|------|-------------|-----------------|
| 1 | Transplant seedlings; remove seedling deck insert | — |
| 2 | Install pot deck insert | — |
| 3 | Reroute drip lines to individual pots | — |
| 4 | Update channel mode to **pot** per channel | UI shows pot setup guide (REQ-CHN-009) |
| 5 | Reassign or create plant profiles with pot-appropriate doseMs | Automation uses new profiles |
| 6 | Adjust light schedule if needed | — |

---

## Journey 5: Software contributor first contribution

**Persona:** Bench Developer  
**Goal:** Ship a traceable spec improvement  
**Target time:** First PR within 5 business days

See [First contribution](../docs/onboarding/first-contribution.md).

---

## Related documents

- [Personas](personas.md)
- [Success metrics](success-metrics.md)
- [Feature spec index](../specs/README.md)
