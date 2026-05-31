Feature: Safety interlocks
  As an operator
  I want the system to fail safe around water and electricity
  So that leaks, pump faults, and unsafe conditions cannot cause damage

  Background:
    Given the Plant Ark Hub is running
    And module "pm-8f3a91c2" is online

  Scenario: Leak blocks all watering
    Given the leak sensor on module "pm-8f3a91c2" reports active
    When any watering command is requested
    Then the Hub shall block the command with result safety_blocked
    And the Hub shall raise a critical leak_detected alert
    And the module shall stop the pump and close all valves

  Scenario: Low reservoir blocks watering
    Given module "pm-8f3a91c2" reports water_level low
    When any watering command is requested
    Then the Hub shall block the command with result safety_blocked
    And the Hub shall raise a warning reservoir_low alert

  Scenario: Global lock prevents concurrent watering
    Given channel "pm-8f3a91c2/1" is currently watering
    When automation requests watering for channel "pm-8f3a91c2/2"
    Then the request for channel 2 shall be queued
    And only one pump shall run at a time

  Scenario: Module enforces max pump duration
    Given a WATER command with duration_ms 8000 and max_duration_ms 12000
    When the module starts watering
    Then the module shall stop the pump after at most 12000ms regardless of command state

  Scenario: Module safe state on bus timeout
    Given the module is watering
    When no Hub communication is received for 10 seconds
    Then the module shall stop the pump
    And the module shall close all valves

  Scenario: Pump fault alert
    Given module "pm-8f3a91c2" reports pump_current_ma 1600
    When the Hub processes the sensor report
    Then the Hub shall raise a pump_fault alert
    And watering for module "pm-8f3a91c2" shall be blocked

  Scenario: No moisture improvement alert
    Given plant "Basil" on channel "pm-8f3a91c2/2" received 3 consecutive doses
    And moisture_norm did not increase after any dose
    When the automation engine evaluates the channel
    Then the Hub shall raise a manual_attention alert
    And no further automated doses shall be sent until acknowledged
