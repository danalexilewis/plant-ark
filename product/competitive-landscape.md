# Competitive Landscape

Plant Ark competes in the **indoor gardening appliance** space but targets a different job than countertop hydroponic units.

## Market segments

| Segment | Examples | Primary job | Plant Ark overlap |
|---------|----------|-------------|-------------------|
| Countertop pod gardens | AeroGarden, Click & Grow, iDOO | Zero-effort herbs on the kitchen counter | Low — different form factor and plant capacity |
| Vertical AI gardens | Gardyn, Rise Gardens | High-density produce with app/cloud | Medium — automation overlap; different architecture |
| Grow tent + manual | Tent + timer + hand watering | Serious indoor grow, user-managed | High — Plant Ark automates this stack |
| DIY smart garden | Pi + ESPHome + AliExpress | Tinkerer-controlled custom setup | High — Plant Ark productises the integration |

## Competitor comparison (v1 positioning)

| Factor | AeroGarden / Click & Grow | Gardyn | Plant Ark |
|--------|---------------------------|--------|-----------|
| Form factor | Countertop unit | Vertical tower | Fold-out cart + tent + tray |
| Plant capacity | 3–12 pod slots | Up to 30 plants | 4–8 channels (v1); 20 long-term |
| Works with your pots/trays | No — proprietary pods | No — proprietary yPods | **Yes** |
| Ongoing consumable cost | ~$120–200/yr pods | Subscription + pods | Water + occasional filter sponge |
| Cloud / account required | Often yes | Yes (Kelby AI) | **No** (local-first) |
| Remote monitoring | App / cloud | App / cloud | Optional Meshtastic (no internet) |
| Repairability | Low — sealed units | Low | **High** — modular clips, open specs |
| Target user | Beginner herb grower | Tech-forward urban grower | Seedling + overwinter gardener |
| Price band | $70–400 unit | $500–900+ | ~$350–450 kit target (see [commercialisation](../roadmap/commercialisation.md)) |

## Why not just DIY (Pi + ESPHome)?

| DIY advantage | Plant Ark response |
|---------------|-------------------|
| Cheapest parts | Plant Ark documents exact BOM and safety interlocks — saves integration time and leak risk |
| Full flexibility | Plant Ark is flexible enough (modular channels, local API) without requiring Home Assistant |
| No vendor lock-in | Plant Ark is open-spec hardware + open Hub software; no cloud lock-in |

DIY is the right choice for someone who wants to build everything from scratch. Plant Ark is for someone who wants a **documented, testable, repairable appliance** assembled from off-the-shelf parts.

## Differentiation thesis

Plant Ark wins on four axes no countertop unit offers together:

1. **Real nursery scale** — seedling tray zones and overwintering pots, not three basil pods.
2. **Local-first trust** — no account, no subscription, data at home (PRIN-03, PRIN-04).
3. **No pod lock-in** — use your own seeds, soil, and pots (PRIN-01, PRIN-02).
4. **Fail-safe water engineering** — NC valves, module firmware interlocks, documented hazard analysis (PRIN-07).

## Positioning statement

> **Plant Ark** is the modular indoor nursery cart for gardeners who outgrow countertop pod gardens but don't want a cloud-dependent tower or a fragile DIY science project.

## Risks to differentiation

| Risk | Mitigation |
|------|------------|
| Perceived as "just parts in a cart" | Product docs (this directory), polished onboarding, clear journeys |
| DIY clones the spec | Open hardware + community; sell convenience and tested safety |
| Incumbents add "tray mode" | Modular cart + local-first remains distinct from pod ecosystems |

See [risk register](../risks/risk-register.md) R-PM-003.

## Related documents

- [Product brief](product-brief.md)
- [Commercialisation plan](../roadmap/commercialisation.md)
- [Constitution](../constitution.md)
