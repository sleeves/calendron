Feature: Display a calendar in Week mode
  In order to know what day it is
  As a developer
  I want to see the calendar

  Background:
    Given I have a calendar titled Work

  Scenario: Viewing all the calendars
    Given I'm on the 'Calendars' page
    Then I should see 'Listing Calendars'

  Scenario: Viewing the calendar in Week mode
    When I'm on the 'Work' calendar page
    Then I should see the title 'Work'
    Then I should see 'Mode'
    And the date mode should be Weekly
    And the time mode should be 'Quarterly'
    Then I should see the calendar
    And I should see all the days of the week

  @javascript
  Scenario: Add an event to the Work calendar
    When I'm on the 'Work' calendar page
    Then I should not see the "Add Event" dialog
    When I click on 12pm on Monday
    Then I should see the "Add Event" dialog
    And I should see an event stub for 12pm on Monday
