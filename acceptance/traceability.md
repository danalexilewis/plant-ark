# Traceability Matrix

Maps every requirement ID to its feature spec, Gherkin scenario, sequence diagram, and MVP acceptance criterion.

## Legend

| Column | Description |
|--------|-------------|
| REQ ID | Stable EARS requirement identifier |
| Feature | Feature spec folder |
| Gherkin | Scenario name in `.feature` file |
| Sequence | Sequence diagram in `sequence.md` |
| MVP | Software (SW) or Hardware (HW) MVP criterion |

## 001 — Module discovery

| REQ ID | Feature | Gherkin scenario | Sequence | MVP |
|--------|---------|------------------|----------|-----|
| REQ-DIS-001 | 001 | Module announces on connect | Module power-on and registration | HW-013 |
| REQ-DIS-002 | 001 | Module announces on connect | Module power-on and registration | SW-001 |
| REQ-DIS-003 | 001 | Module announces on connect | Module power-on and registration | SW-002 |
| REQ-DIS-004 | 001 | Module announces on connect | — | SW-002 |
| REQ-DIS-005 | 001 | Known module reconnects | — | — |
| REQ-DIS-006 | 001 | Module announces on connect | Module power-on and registration | SW-001 |
| REQ-DIS-007 | 001 | Module announces on connect | Module power-on and registration | SW-001 |
| REQ-DIS-008 | 001 | Operator identifies module | Identify flow | HW-014, SW-003 |
| REQ-DIS-009 | 001 | Module goes offline | Offline detection | — |
| REQ-DIS-010 | 001 | Module goes offline | Offline detection | SW-007 |
| REQ-DIS-011 | 001 | Module announces on connect | — | SW-001 |

## 002 — Channel / plant assignment

| REQ ID | Feature | Gherkin scenario | Sequence | MVP |
|--------|---------|------------------|----------|-----|
| REQ-CHN-001 | 002 | Assign plant to channel | Assign plant to channel | SW-004 |
| REQ-CHN-002 | 002 | Set channel mode | — | — |
| REQ-CHN-003 | 002 | Disable channel | — | — |
| REQ-CHN-004 | 002 | Assign plant to channel | Assign plant to channel | SW-004 |
| REQ-CHN-005 | 002 | Create plant profile | Assign plant to channel | SW-004 |
| REQ-CHN-006 | 002 | Disable channel | Automation reads assignment | — |
| REQ-CHN-007 | 002 | Unassign plant from channel | — | — |
| REQ-CHN-008 | 002 | — | — | — |

## 003 — Manual watering

| REQ ID | Feature | Gherkin scenario | Sequence | MVP |
|--------|---------|------------------|----------|-----|
| REQ-MAN-001 | 003 | Manual water succeeds | Successful manual water | SW-006, HW-015 |
| REQ-MAN-002 | 003 | Manual water succeeds | Successful manual water | SW-006 |
| REQ-MAN-003 | 003 | Manual water succeeds | Successful manual water | SW-006 |
| REQ-MAN-004 | 003 | — | — | — |
| REQ-MAN-005 | 003 | Manual water blocked module offline | Blocked by safety | SW-007 |
| REQ-MAN-006 | 003 | Manual water blocked by leak | Blocked by safety | SW-010 |
| REQ-MAN-007 | 003 | Manual water queued behind global lock | Successful manual water | — |
| REQ-MAN-008 | 003 | Manual water succeeds | Successful manual water | — |

## 004 — Automated watering

| REQ ID | Feature | Gherkin scenario | Sequence | MVP |
|--------|---------|------------------|----------|-----|
| REQ-AUT-001 | 004 | Automation waters dry plant | Automation evaluation loop | SW-008 |
| REQ-AUT-002 | 004 | Re-water after soak wait if still dry | Soak wait and re-evaluation | — |
| REQ-AUT-003 | 004 | Re-water after soak wait if still dry | Soak wait and re-evaluation | — |
| REQ-AUT-004 | 004 | Quiet hours suppress watering | — | — |
| REQ-AUT-005 | 004 | Daily max reached | Automation evaluation loop | SW-009 |
| REQ-AUT-006 | 004 | Automation skips disabled channel | — | — |
| REQ-AUT-007 | 004 | — | — | — |
| REQ-AUT-008 | 004 | Automation evaluation loop | Automation evaluation loop | — |
| REQ-AUT-009 | 004 | Automation waters dry plant | Automation evaluation loop | — |

## 005 — Safety interlocks

| REQ ID | Feature | Gherkin scenario | Sequence | MVP |
|--------|---------|------------------|----------|-----|
| REQ-SAF-001 | 005 | Module safe state on bus timeout | Module bus timeout safe state | HW-011 |
| REQ-SAF-002 | 005 | Module safe state on bus timeout | Module bus timeout safe state | HW-012 |
| REQ-SAF-003 | 005 | Leak blocks all watering | Leak detection and global block | HW-009, SW-010 |
| REQ-SAF-004 | 005 | Low reservoir blocks watering | — | HW-010, SW-011 |
| REQ-SAF-005 | 005 | Global lock prevents concurrent watering | Global watering lock | HW-004 |
| REQ-SAF-006 | 005 | Module enforces max pump duration | — | — |
| REQ-SAF-007 | 005 | — | — | — |
| REQ-SAF-008 | 005 | Global lock prevents concurrent watering | Global watering lock | — |
| REQ-SAF-009 | 005 | Leak blocks all watering | Leak detection and global block | SW-010 |
| REQ-SAF-010 | 005 | Low reservoir blocks watering | — | SW-011 |
| REQ-SAF-011 | 005 | Pump fault alert | — | — |
| REQ-SAF-012 | 005 | No moisture improvement alert | — | — |

## 006 — Alerts and maintenance

| REQ ID | Feature | Gherkin scenario | Sequence | MVP |
|--------|---------|------------------|----------|-----|
| REQ-ALT-001 | 006 | Leak alert raised | Alert creation flow | SW-012 |
| REQ-ALT-002 | 006 | — | Alert creation flow | SW-011 |
| REQ-ALT-003 | 006 | Module offline alert | — | — |
| REQ-ALT-004 | 006 | Pump fault alert | — | — |
| REQ-ALT-005 | 006 | — | — | — |
| REQ-ALT-006 | 006 | Filter maintenance reminder | Maintenance reminder evaluation | — |
| REQ-ALT-007 | 006 | Operator acknowledges alert | Acknowledgement | — |
| REQ-ALT-008 | 006 | Leak alert raised | Alert creation flow | SW-012 |
| REQ-ALT-009 | 006 | Duplicate alert deduplicated | Alert creation flow | — |

## 007 — Environment and light control

| REQ ID | Feature | Gherkin scenario | Sequence | MVP |
|--------|---------|------------------|----------|-----|
| REQ-ENV-001 | 007 | Light schedule turns on | Light schedule | — |
| REQ-ENV-002 | 007 | Light schedule turns off | Light schedule | — |
| REQ-ENV-003 | 007 | Temperature low alert | Environment sensor ingestion | — |
| REQ-ENV-004 | 007 | Temperature high alert | Environment sensor ingestion | — |
| REQ-ENV-005 | 007 | Manual fan control | — | — |
| REQ-ENV-006 | 007 | Dashboard shows environment readings | Environment sensor ingestion | — |
| REQ-ENV-007 | 007 | — | — | — |
| REQ-ENV-008 | 007 | — | — | — |

## 008 — Meshtastic status and alerts

| REQ ID | Feature | Gherkin scenario | Sequence | MVP |
|--------|---------|------------------|----------|-----|
| REQ-MESH-001 | 008 | Hub operates without Meshtastic | — | — |
| REQ-MESH-002 | 008 | — | Periodic summary publish | — |
| REQ-MESH-003 | 008 | — | — | — |
| REQ-MESH-004 | 008 | Critical alert published | Critical alert publish | SW-014 |
| REQ-MESH-005 | 008 | Periodic status summary | Periodic summary publish | SW-013 |
| REQ-MESH-006 | 008 | Duplicate alert deduplicated | Critical alert publish | — |
| REQ-MESH-007 | 008 | Stub mode logs payload | Periodic summary publish | SW-013, SW-014 |

## 009 — Dashboard monitoring

| REQ ID | Feature | Gherkin scenario | Sequence | MVP |
|--------|---------|------------------|----------|-----|
| REQ-DSH-001 | 009 | Dashboard shows system overview | Dashboard load | — |
| REQ-DSH-002 | 009 | Dashboard shows system overview | Dashboard load | — |
| REQ-DSH-003 | 009 | Dashboard shows environment readings | Dashboard load | — |
| REQ-DSH-004 | 009 | Dashboard shows system overview | Dashboard load | — |
| REQ-DSH-005 | 009 | Plants needing water highlighted | Dashboard load | SW-005 |
| REQ-DSH-006 | 009 | Active alerts on dashboard | Dashboard load | SW-012 |
| REQ-DSH-007 | 009 | Recent watering events | Dashboard load | — |
| REQ-DSH-008 | 009 | Mobile viewport layout | Mobile viewport layout | — |
| REQ-DSH-009 | 009 | Real-time sensor update | Real-time WebSocket updates | SW-005 |

## Constitution / safety (cross-cutting)

| REQ ID | Feature | Gherkin scenario | Sequence | MVP |
|--------|---------|------------------|----------|-----|
| REQ-SAF-M01–M07 | 005 | Multiple | Module bus timeout | HW-009–012 |
| REQ-SAF-H01–H04 | 005 | Leak blocks all watering | Leak detection | SW-010, SW-011 |
| REQ-SAF-E01–E03 | — | — | — | HW-003 |
| REQ-WQ-01–04 | — | — | — | HW-006 |

## Hardware reference requirements

| REQ ID | Document | MVP |
|--------|----------|-----|
| REQ-HW-CF-001–009 | cart-frame.md | — |
| REQ-HW-RT-001–011 | reservoir-tray.md | HW-006 |
| REQ-HW-PD-001–006 | plant-deck.md | — |
| REQ-HW-GT-001–009 | grow-tent.md | — |
| REQ-HW-IM-001–010 | irrigation-module.md | HW-001–015 |
| REQ-HW-PF-001–007 | pump-filter-cassette.md | HW-002, HW-006 |
| REQ-HW-VM-001–006 | valves-manifold.md | HW-004, HW-005 |

## Software MVP quick reference

| MVP ID | Requirement | Primary REQ IDs |
|--------|-------------|-----------------|
| SW-001 | Simulated modules auto-register | REQ-DIS-001, 006, 007 |
| SW-002 | 4 channels per module | REQ-DIS-003, 004 |
| SW-003 | Name modules and channels | REQ-DIS-008 |
| SW-004 | Assign plants to channels | REQ-CHN-004, 005 |
| SW-005 | Display moisture readings | REQ-DSH-005, 009 |
| SW-006 | Manual water + event log | REQ-MAN-001, 003 |
| SW-007 | Offline blocks manual water | REQ-MAN-005, REQ-DIS-010 |
| SW-008 | Automation triggers watering | REQ-AUT-001 |
| SW-009 | Daily max enforced | REQ-AUT-005 |
| SW-010 | Leak blocks watering + alert | REQ-SAF-009, REQ-ALT-001 |
| SW-011 | Reservoir low blocks watering | REQ-SAF-010 |
| SW-012 | Alerts in UI | REQ-ALT-008, REQ-DSH-006 |
| SW-013 | Mesh stub logs summary | REQ-MESH-005, 007 |
| SW-014 | Mesh stub logs alert | REQ-MESH-004, 007 |

## Hardware MVP quick reference

| MVP ID | Requirement | Primary REQ IDs |
|--------|-------------|-----------------|
| HW-001 | Module clips to tray | REQ-HW-IM-002 |
| HW-002 | Cassette removable | REQ-HW-PF-001 |
| HW-003 | Dry bay above splash line | REQ-HW-IM-003 |
| HW-004 | Water delivered to channel | REQ-HW-VM-001, REQ-MAN-001 |
| HW-005 | Runoff returns to reservoir | REQ-HW-RT-005 |
| HW-006 | Pump recirculates from reservoir | REQ-HW-PF-007 |
| HW-007 | 4 moisture readings reported | REQ-HW-IM-006 |
| HW-008 | Low level reported | REQ-SAF-004 |
| HW-009 | Leak stops watering | REQ-SAF-003 |
| HW-010 | Low level rejects watering | REQ-SAF-004 |
| HW-011 | Safe boot state | REQ-SAF-001 |
| HW-012 | Bus timeout safe state | REQ-SAF-002 |
| HW-013 | HELLO registration | REQ-DIS-001, 006 |
| HW-014 | Identify button works | REQ-DIS-008 |
| HW-015 | UI manual water works | REQ-MAN-001, HW-004 |

## Coverage summary

| Area | REQ count | Gherkin scenarios | Sequence diagrams |
|------|-----------|-------------------|-------------------|
| 001 Discovery | 11 | 5 | 3 |
| 002 Assignment | 8 | 5 | 2 |
| 003 Manual water | 8 | 4 | 2 |
| 004 Automated water | 9 | 6 | 2 |
| 005 Safety | 12 | 7 | 3 |
| 006 Alerts | 9 | 6 | 3 |
| 007 Environment | 8 | 6 | 2 |
| 008 Meshtastic | 7 | 5 | 2 |
| 009 Dashboard | 9 | 7 | 2 |
| Constitution/safety | 18 | — | — |
| Hardware refs | 46 | — | — |
| **Total** | **~145** | **51** | **23** |

## Related documents

- [Software MVP acceptance](software-mvp.md)
- [Hardware MVP acceptance](hardware-mvp.md)
- [Feature spec index](../specs/README.md)
- [Constitution](../constitution.md)
