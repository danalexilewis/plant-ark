Feature: Alerts and maintenance
  As an operator
  I want to see and manage system alerts and maintenance reminders
  So that I can respond to faults and keep the system healthy

  Background:
    Given the Plant Ark Hub is running

  Scenario: Leak alert raised
    When module "pm-8f3a91c2" reports leak true
    Then the Hub shall create a critical alert type leak_detected
    And the UI shall display the alert on the dashboard

  Scenario: Operator acknowledges alert
    Given a critical leak_detected alert exists with acknowledged false
    When the operator acknowledges the alert
    Then the alert acknowledged shall be true
    And the UI shall move the alert to acknowledged history

  Scenario: Filter maintenance reminder
    Given the last filter cleaning was 31 days ago for module "pm-8f3a91c2"
    When the Hub evaluates maintenance schedules
    Then the Hub shall create an info alert type filter_due
    And the message shall include module "pm-8f3a91c2"

  Scenario: Duplicate alert deduplicated
    Given a warning reservoir_low alert was created 5 minutes ago
    When module "pm-8f3a91c2" reports water_level low again
    Then the Hub shall not create a duplicate alert within 15 minutes

  Scenario: Module offline alert
    Given module "pm-8f3a91c2" has been offline for 5 minutes
    Then the Hub shall create a warning alert type module_offline
    And the message shall include module name or id

  Scenario: Pump fault alert
    Given module "pm-8f3a91c2" reports pump_current_ma 1600
    Then the Hub shall create a warning alert type pump_fault
