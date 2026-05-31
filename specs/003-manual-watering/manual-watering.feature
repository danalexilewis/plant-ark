Feature: Manual watering
  As an operator
  I want to manually trigger watering on a channel
  So that I can test the system or provide extra water when needed

  Background:
    Given the Plant Ark Hub is running
    And module "pm-8f3a91c2" is online
    And channel "pm-8f3a91c2/2" has plant "Basil" assigned with doseMs 8000
    And channel "pm-8f3a91c2/2" is enabled
    And no safety lock is active

  Scenario: Manual water succeeds
    When the operator presses manual water on channel "pm-8f3a91c2/2"
    Then the Hub shall send COMMAND water to module "pm-8f3a91c2" channel 2 duration 8000ms
    And the module shall respond with EVENT water_complete
    And the Hub shall log an ActuationEvent with result success
    And the UI shall show last watered timestamp for "Basil"

  Scenario: Manual water blocked module offline
    Given module "pm-8f3a91c2" is offline
    When the operator presses manual water on channel "pm-8f3a91c2/2"
    Then the Hub shall reject the request
    And the UI shall display error "Module offline"
    And no WATER command shall be sent

  Scenario: Manual water blocked by leak
    Given a leak_detected alert is active
    When the operator presses manual water on channel "pm-8f3a91c2/2"
    Then the Hub shall reject the request with result safety_blocked
    And the UI shall display error "Watering blocked: leak detected"

  Scenario: Manual water queued behind global lock
    Given channel "pm-8f3a91c2/1" is currently watering
    When the operator presses manual water on channel "pm-8f3a91c2/2"
    Then the Hub shall queue the water command for channel 2
    And the UI shall show watering queued for "Basil"
