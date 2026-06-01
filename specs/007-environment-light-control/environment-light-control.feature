Feature: Environment and light control
  As an operator
  I want to schedule grow lights and monitor tent conditions
  So that my plants have a suitable environment for growth

  Background:
    Given the Plant Ark Hub is running
    And a grow light is connected via certified smart plug "light-plug-1"
    And an environment sensor reports tent temperature and humidity

  Scenario: Light schedule turns on
    Given the light schedule is set to on at 06:00 and off at 22:00
    When the current time reaches 06:00
    Then the Hub shall send light_on to smart plug "light-plug-1"
    And the Hub shall log an ActuationEvent action light_on

  Scenario: Light schedule turns off
    Given the grow light is currently on
    When the current time reaches 22:00
    Then the Hub shall send light_off to smart plug "light-plug-1"

  Scenario: Manual fan control
    When the operator toggles fan on via the UI
    Then the Hub shall send fan_on to the configured fan smart plug
    When the operator toggles fan off via the UI
    Then the Hub shall send fan_off to the configured fan smart plug

  Scenario: Temperature low alert
    Given the environment sensor reports air_temperature_c 10.5
    When the Hub processes the sensor reading
    Then the Hub shall create a warning alert type temperature_low

  Scenario: Temperature high alert
    Given the environment sensor reports air_temperature_c 32.0
    When the Hub processes the sensor reading
    Then the Hub shall create a warning alert type temperature_high

  Scenario: Dashboard shows environment readings
    Given the environment sensor reports air_temperature_c 19.1 and humidity_percent 68
    When the operator opens the dashboard
    Then the UI shall display tent temperature 19.1 °C
    And the UI shall display humidity 68%

  Scenario: Humidity low alert
    Given the environment sensor reports humidity_percent 35
    When the Hub processes the sensor reading
    Then the Hub shall create a warning alert type humidity_low

  Scenario: Humidity high alert
    Given the environment sensor reports humidity_percent 88
    When the Hub processes the sensor reading
    Then the Hub shall create a warning alert type humidity_high
