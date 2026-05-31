Feature: Module discovery
  As an operator
  I want irrigation modules to auto-register when connected to PlantBus
  So that I can name and configure them without manual bus setup

  Background:
    Given the Plant Ark Hub is running
    And the plantbus-service is connected

  Scenario: Module announces on connect
    When module "pm-8f3a91c2" sends HELLO with type "nursery-4ch-v1" and 4 channels
    Then the Hub shall register module "pm-8f3a91c2" with status online
    And the Hub shall create channels "pm-8f3a91c2/1" through "pm-8f3a91c2/4"
    And the UI shall display "New module found" for module "pm-8f3a91c2"

  Scenario: Operator identifies module
    Given module "pm-8f3a91c2" is registered with name null
    When the operator presses the identify button on module "pm-8f3a91c2"
    Then the UI shall highlight the module card for "pm-8f3a91c2"
    And the UI shall prompt the operator to name the module

  Scenario: Operator names module and channels
    Given module "pm-8f3a91c2" is highlighted in the UI
    When the operator sets module name to "Top shelf left"
    And the operator sets channel 1 name to "Tomato seedlings"
    And the operator sets channel 2 name to "Basil"
    Then the Hub shall persist module name "Top shelf left"
    And channel "pm-8f3a91c2/1" shall display as "Tomato seedlings"

  Scenario: Module goes offline
    Given module "pm-8f3a91c2" is registered with status online
    When no HEARTBEAT is received for 90 seconds
    Then the Hub shall set module "pm-8f3a91c2" status to offline
    And the UI shall display the module as offline

  Scenario: Known module reconnects
    Given module "pm-8f3a91c2" was previously registered with name "Top shelf left"
    When module "pm-8f3a91c2" sends HELLO again after reconnect
    Then the Hub shall update lastSeenAt without creating duplicate channels
    And the module name shall remain "Top shelf left"
