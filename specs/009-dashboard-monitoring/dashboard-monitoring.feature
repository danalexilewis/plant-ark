Feature: Dashboard monitoring
  As an operator
  I want a mobile-friendly dashboard showing nursery status
  So that I can monitor and manage the system at a glance

  Background:
    Given the Plant Ark Hub is running
    And module "pm-8f3a91c2" is online with 4 channels
    And 2 plants are assigned with 1 needing water

  Scenario: Dashboard shows system overview
    When the operator opens the dashboard
    Then the UI shall display system status
    And the UI shall display reservoir level
    And the UI shall display water temperature
    And the UI shall display online module count 1

  Scenario: Plants needing water highlighted
    Given channel "pm-8f3a91c2/1" moisture_norm is 0.35 below target 0.42
    When the operator opens the dashboard
    Then the UI shall show "Tomato seedlings" in the needs-water list

  Scenario: Active alerts on dashboard
    Given a critical leak_detected alert exists unacknowledged
    When the operator opens the dashboard
    Then the UI shall display the alert with severity critical
    And the alert shall be visible above the fold on mobile viewport

  Scenario: Recent watering events
    Given 3 watering events occurred today
    When the operator opens the dashboard
    Then the UI shall display the last 10 watering events with timestamp and result

  Scenario: Mobile viewport layout
    When the operator opens the dashboard on a 375px wide viewport
    Then all dashboard cards shall be readable without horizontal scrolling
    And touch targets shall be at least 44px

  Scenario: Real-time sensor update
    Given the operator is viewing the dashboard
    When a new SENSOR_REPORT arrives for module "pm-8f3a91c2"
    Then the moisture cards shall update within 5 seconds

  Scenario: Navigate to module detail
    When the operator taps module "Top shelf left" on the dashboard
    Then the UI shall navigate to the module detail screen
    And the module detail shall show all 4 channels with sensor readings
