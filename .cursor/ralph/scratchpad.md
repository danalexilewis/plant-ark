---
iteration: 1
max_iterations: 10
completion_promise: "PLANT_ARK_DONE"
---

Compile the Plant Ark spec-driven documentation set per docs plan. This is a
SPEC-ONLY build: no application code. Produce references, EARS acceptance
criteria, Gherkin .feature UX flows, and mermaid sequenceDiagram workflows.
Work the 10 packages in order; each iteration completes one package and
cross-links it. Emit <promise>PLANT_ARK_DONE</promise> ONLY when every package
exists, all REQ IDs are traced, no TODO/placeholder remains, and the doc set
fully covers the brief.
