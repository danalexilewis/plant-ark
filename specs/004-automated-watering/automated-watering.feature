Feature: Automated watering
  As an operator
  I want the system to water plants automatically when soil is dry
  So that my plants receive consistent care without daily manual intervention

  Background:
    Given the Plant Ark Hub is running
    And the automation engine is active
    And module "pm-8f3a91c2" is online
    And no safety lock is active
    And channel "pm-8f3a91c2/1" has plant "Tomato seedlings" assigned
    And plant "Tomato seedlings" has targetMoistureMin 0.42 and doseMs 5000
    And plant "Tomato seedlings" has maxDosesPerDay 4

  Scenario: Automation waters dry plant
    Given channel "pm-8f3a91c2/1" moisture_norm is 0.35
    When the automation engine evaluates channels
    Then the Hub shall queue a WATER command for channel "pm-8f3a91c2/1" duration 5000ms
    And the Hub shall log the automation decision

  Scenario: Automation skips moist plant
    Given channel "pm-8f3a91c2/1" moisture_norm is 0.55
    When the automation engine evaluates channels
    Then no WATER command shall be sent for channel "pm-8f3a91c2/1"
    And the Hub shall log decision skip reason "moisture_above_target"

  Scenario: Daily max reached
    Given channel "pm-8f3a91c2/1" moisture_norm is 0.35
    And plant "Tomato seedlings" has received 4 doses today
    When the automation engine evaluates channels
    Then no WATER command shall be sent for channel "pm-8f3a91c2/1"
    And the Hub shall log decision skip reason "daily_max_reached"

  Scenario: Quiet hours suppress watering
    Given channel "pm-8f3a91c2/1" moisture_norm is 0.38
    And plant "Tomato seedlings" has quietHours 22:00 to 07:00
    And the current time is 23:30
    When the automation engine evaluates channels
    Then no WATER command shall be sent for channel "pm-8f3a91c2/1"
    And the Hub shall log decision skip reason "quiet_hours"

  Scenario: Automation skips disabled channel
    Given channel "pm-8f3a91c2/4" is disabled
    When the automation engine evaluates channels
    Then channel "pm-8f3a91c2/4" shall be excluded from evaluation

  Scenario: Re-water after soak wait if still dry
    Given a watering dose completed for "Tomato seedlings"
    And soakWaitMinutes 10 has elapsed
    And channel "pm-8f3a91c2/1" moisture_norm is still 0.38
    And plant "Tomato seedlings" has received 1 dose today
    When the automation engine evaluates channels
    Then the Hub shall queue another WATER command for channel "pm-8f3a91c2/1"
