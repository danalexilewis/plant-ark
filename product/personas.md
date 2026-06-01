# Personas and Jobs-to-be-Done

Who Plant Ark is for and what they need it to do. Feature specs should trace back to at least one persona and one job below.

## Persona 1: Seedling Starter — Sam

| Attribute | Detail |
|-----------|--------|
| Context | Urban flat with a spare corner; starts tomatoes, chillies, and herbs from seed every spring |
| Skill level | Confident gardener; not an electrician |
| Time budget | 15 min/day checking seedlings during germination weeks |

### Jobs-to-be-done

| Job | Success looks like |
|-----|-------------------|
| Keep 4 seedling zones evenly moist through germination | No dry corners, no mould from over-watering |
| Run lights on a consistent schedule | 16 h on / 8 h off without manual timer juggling |
| Know when something is wrong before seedlings die | Alert on leak, low reservoir, or module offline |

### Pain points today

- Hand-watering seed trays twice daily is tedious and inconsistent
- Cheap seedling heat mats + domes don't integrate watering
- Countertop gardens don't fit a full seed tray

### Must never have to

- Create a cloud account to water seedlings
- Buy proprietary pod refills every month
- Open the electronics bay with tools for routine cleaning

---

## Persona 2: Overwinterer — Jordan

| Attribute | Detail |
|-----------|--------|
| Context | Suburban house; brings rosemary, citrus, and chillies indoors for winter |
| Skill level | Experienced outdoor gardener; new to indoor automation |
| Time budget | 5 min/day glance at dashboard; weekly reservoir top-up |

### Jobs-to-be-done

| Job | Success looks like |
|-----|-------------------|
| Keep 4–8 potted plants watered through winter | Each pot on its own channel; moisture within target band |
| Maintain tent temperature and humidity in range | Alerts when out of band; fan control available |
| Overwinter without daily hand-watering while travelling occasionally | Automation runs locally; optional Meshtastic alert if leak |

### Pain points today

- Self-watering spikes and capillary mats don't scale to mixed pot sizes
- Grow tents with manual timers forget to adjust as daylight changes
- Worries about water leaks near flooring when away

### Must never have to

- Trust a cloud service to keep plants alive
- Rewire mains inside the tent
- Disassemble the whole cart to rinse the reservoir

---

## Persona 3: Maker/Tinkerer — Alex

| Attribute | Detail |
|-----------|--------|
| Context | Builds and maintains the bench prototype; may contribute firmware or Hub software |
| Skill level | Comfortable with ESP32, Raspberry Pi, CAN bus |
| Time budget | Hours on bench bring-up; ongoing as hobby |

### Jobs-to-be-done

| Job | Success looks like |
|-----|-------------------|
| Bench-test one module before cart integration | All HW MVP acceptance criteria pass on perfboard |
| Develop Hub software without hardware | Simulator fakes two 4-channel modules |
| Swap a failed valve or pump without replacing the module | Clip-off module; tool-free cassette removal |

### Pain points today

- Generic IoT stacks (ESPHome + HA) lack integrated safety interlocks for water
- No single spec tying hardware, firmware, and UI together

### Must never have to

- Reverse-engineer wiring from scattered blog posts
- Guess which REQ ID is authoritative when constitution and specs disagree

---

## Persona 4: Bench Developer — Riley

| Attribute | Detail |
|-----------|--------|
| Context | Software contributor working on hub-api, automation-engine, or hub-ui |
| Skill level | TypeScript/React; may never touch a soldering iron |
| Time budget | First contribution within a week of joining |

### Jobs-to-be-done

| Job | Success looks like |
|-----|-------------------|
| Run the full software MVP on a laptop | Simulator + UI + API in Docker Compose |
| Understand a feature end-to-end | Read spec.md + .feature + sequence.md for one feature |
| Ship a spec change safely | Update traceability matrix with new REQ ID |

---

## Persona 5: Away Traveler — Morgan (optional Meshtastic)

| Attribute | Detail |
|-----------|--------|
| Context | Uses Plant Ark at a weekend house or checks nursery while on holiday |
| Skill level | Same as Jordan; adds a Meshtastic node |
| Time budget | Check phone for LoRa summary twice daily |

### Jobs-to-be-done

| Job | Success looks like |
|-----|-------------------|
| Know the nursery is OK without opening the local UI | 30-min status summary over Meshtastic |
| Get immediate notice of leak or critical fault | Critical alert packet within 60 s |

### Must never have to

- Expose the Hub to the public internet
- Depend on Meshtastic for core watering (Hub runs autonomously)

---

## Persona priority for v1

| Priority | Persona | Rationale |
|----------|---------|-----------|
| P0 | Seedling Starter, Overwinterer | Primary product users |
| P1 | Maker/Tinkerer | Prototype builder and early adopter |
| P1 | Bench Developer | Software MVP delivery |
| P2 | Away Traveler | Optional; Meshtastic is PRIN-10 optional |

## Related documents

- [User journeys](user-journeys.md)
- [Product brief](product-brief.md)
- [Onboarding guide](../docs/onboarding.md)
