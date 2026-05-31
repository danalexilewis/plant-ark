Feature: Channel and plant assignment
  As an operator
  I want to assign plants to module channels with watering profiles
  So that each plant or zone receives appropriate automated care

  Background:
    Given the Plant Ark Hub is running
    And module "pm-8f3a91c2" is registered with 4 channels
    And module "pm-8f3a91c2" is online

  Scenario: Create plant profile
    When the operator creates a plant "Tomato seedlings" with stage "seedling"
    And sets targetMoistureMin to 0.42
    And sets targetMoistureMax to 0.62
    And sets doseMs to 5000
    And sets soakWaitMinutes to 10
    And sets maxDosesPerDay to 4
    Then the Hub shall persist plant "Tomato seedlings" with the watering profile

  Scenario: Assign plant to channel
    Given plant "Tomato seedlings" exists
    When the operator assigns plant "Tomato seedlings" to channel "pm-8f3a91c2/1"
    Then channel "pm-8f3a91c2/1" shall have plantId referencing "Tomato seedlings"
    And the UI shall display "Tomato seedlings" on channel 1

  Scenario: Set channel mode
    When the operator sets channel "pm-8f3a91c2/1" mode to "seedling-zone"
    And the operator sets channel "pm-8f3a91c2/2" mode to "pot"
    Then channel "pm-8f3a91c2/1" mode shall be "seedling-zone"
    And channel "pm-8f3a91c2/2" mode shall be "pot"

  Scenario: Disable channel
    Given channel "pm-8f3a91c2/4" has no plant assigned
    When the operator disables channel "pm-8f3a91c2/4"
    Then channel "pm-8f3a91c2/4" enabled shall be false
    And automation shall skip channel "pm-8f3a91c2/4"

  Scenario: Unassign plant from channel
    Given channel "pm-8f3a91c2/1" has plant "Tomato seedlings" assigned
    When the operator unassigns the plant from channel "pm-8f3a91c2/1"
    Then channel "pm-8f3a91c2/1" plantId shall be null
    And automation shall skip channel "pm-8f3a91c2/1"
