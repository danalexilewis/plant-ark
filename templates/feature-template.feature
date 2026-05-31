# Feature: [Feature Name]
# Feature ID: NNN-feature-name
# Related spec: spec.md

Feature: [Feature Name]

  As a [role]
  I want [capability]
  So that [benefit]

  Background:
    Given the Plant Ark Hub is running
    And at least one irrigation module is online

  Scenario: [Happy path title]
    Given [precondition]
    When [action]
    Then [expected outcome]

  Scenario: [Edge case title]
    Given [precondition]
    When [action]
    Then [expected outcome]

  Scenario: [Safety block title]
    Given [safety precondition]
    When [action]
    Then [blocked outcome]
    And [alert or log entry]
