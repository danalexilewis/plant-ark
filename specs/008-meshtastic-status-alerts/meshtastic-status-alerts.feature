Feature: Meshtastic status and alerts
  As an operator away from home
  I want status summaries and critical alerts via Meshtastic
  So that I can monitor the nursery without cloud dependency

  Background:
    Given the Plant Ark Hub is running
    And the mesh-bridge service is active

  Scenario: Periodic status summary
    Given 30 minutes have elapsed since the last summary
    When the mesh-bridge evaluates publish schedule
    Then the mesh-bridge shall publish a plant_hub_status packet
    And the packet shall include plants count, needs_water, reservoir, and leak status

  Scenario: Critical alert published
    When the Hub creates a critical leak_detected alert
    Then the mesh-bridge shall publish a plant_hub_alert packet within 60 seconds
    And the packet severity shall be critical

  Scenario: Duplicate alert deduplicated
    Given a leak_detected alert was published 10 minutes ago
    And leak state is still active
    When the Hub processes another leak sensor report
    Then the mesh-bridge shall not republish within 15 minutes

  Scenario: Stub mode logs payload
    Given no Meshtastic hardware is connected
    When the mesh-bridge receives a status summary to publish
    Then the mesh-bridge shall log the JSON payload to console
    And the Hub shall continue normal operation

  Scenario: Hub operates without Meshtastic
    Given the mesh-bridge service is stopped
    When the operator uses the local UI
    Then all core functions shall work normally
