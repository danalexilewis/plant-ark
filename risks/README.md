# Risk Management

How Plant Ark identifies, scores, and mitigates project and product risks.

## Scoring method

Risks use a **5 × 5 likelihood × impact** matrix:

| Score | Likelihood | Impact |
|-------|------------|--------|
| 1 | Rare (< 10 % in project life) | Negligible — no schedule or safety effect |
| 2 | Unlikely | Minor — small delay or cosmetic issue |
| 3 | Possible | Moderate — milestone slip or degraded UX |
| 4 | Likely | Major — safety near-miss, failed beta, significant cost |
| 5 | Almost certain | Severe — injury, property damage, project failure |

**Risk score** = Likelihood × Impact (1–25).

| Band | Score | Action |
|------|-------|--------|
| Low | 1–6 | Monitor |
| Medium | 7–12 | Mitigate before next gate |
| High | 13–19 | Mitigate immediately; escalate |
| Critical | 20–25 | Stop work until mitigated |

## Action priority (safety hazards)

For [hazard analysis](hazard-analysis.md), use **Severity × Occurrence × Detection** (FMEA-style) and map controls to `REQ-SAF-*` IDs. Residual risk must be acceptable before hardware water test.

## Ownership and review

| Role | Responsibility |
|------|----------------|
| Project lead | Maintains [risk register](risk-register.md); monthly review |
| Hardware lead | Hazard analysis updates when design changes |
| Software lead | Tracks integration and bus-factor risks |

Review cadence: **monthly** during prototype phase; **before each manufacturing gate** (bench → PCB → beta → retail).

## Related documents

- [Risk register](risk-register.md)
- [Hazard analysis](hazard-analysis.md)
- [Safety requirements](../docs/safety/safety-requirements.md)
- [Constitution](../constitution.md)
