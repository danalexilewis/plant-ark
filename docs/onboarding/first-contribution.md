# First Contribution

A concrete good-first task for new contributors. Target: **first merged PR within 5 business days** of joining.

## Recommended task

**Add a Gherkin scenario for an unmapped requirement and update traceability.**

This teaches the spec-driven workflow without touching hardware or application code.

### Example: REQ-MAN-004 (module rejects WATER command)

1. Open [specs/003-manual-watering/spec.md](../../specs/003-manual-watering/spec.md) — read REQ-MAN-004
2. Add a scenario to [manual-watering.feature](../../specs/003-manual-watering/manual-watering.feature):

```gherkin
  Scenario: Module rejects watering command
    Given module "pm-8f3a91c2" is online
    And the module firmware rejects the WATER command with reason "valve_fault"
    When the operator taps "Water now" for channel "pm-8f3a91c2/1"
    Then the UI shall display "Watering failed: valve_fault"
    And no further WATER commands shall be sent until the operator retries
```

3. Add a row to [acceptance/traceability.md](../../acceptance/traceability.md) linking REQ-MAN-004 to the new scenario
4. Open a PR referencing REQ-MAN-004

### Other unmapped REQs suitable for first PR

| REQ ID | Feature | Suggested scenario |
|--------|---------|-------------------|
| REQ-MAN-004 | 003 Manual watering | Module rejects command |
| REQ-SAF-007 | 005 Safety | Duplicate command_id rejected |
| REQ-MESH-001 | 008 Meshtastic | Hub operates without Meshtastic configured |

See [traceability matrix](../../acceptance/traceability.md) for rows with `—` in the Gherkin column.

## Spec change workflow

1. **Identify** the REQ ID affected (never reuse retired IDs)
2. **Edit** `spec.md` if the requirement text changes
3. **Edit** `.feature` for UX behaviour
4. **Edit** `sequence.md` if message flow changes
5. **Update** [traceability.md](../../acceptance/traceability.md)
6. **PR description** must list REQ IDs and rationale
7. **Constitution changes** require explicit team discussion — do not silently edit principles

## PR checklist

- [ ] EARS wording is testable (no vague "prominently" without criteria)
- [ ] Gherkin scenario name matches traceability row
- [ ] No duplicate REQ IDs
- [ ] Links to related docs still valid
- [ ] If timing values change, update [timing-and-alerting.md](../references/timing-and-alerting.md)

## Alternative first tasks

| Task | Skill | Doc |
|------|-------|-----|
| Fix a doc link or typo | Any | Any `.md` file |
| Add glossary term with back-link | Any | [glossary.md](../glossary.md) |
| Expand hazard analysis row | Hardware | [hazard-analysis.md](../../risks/hazard-analysis.md) |
| Review competitive landscape fact | Product | [competitive-landscape.md](../../product/competitive-landscape.md) |

## Getting help

- Open a GitHub issue for questions
- Reference REQ IDs in all spec discussions
- Check [open questions](../../roadmap/open-questions.md) before inventing new design decisions

## Related documents

- [Week 1 reading](week-1.md)
- [Templates](../../templates/spec-template.md)
- [Spec README](../../specs/README.md)
