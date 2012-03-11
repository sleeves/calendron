Feature: Display a calendar
  In order to know what day it is
  As a developer
  I want to see the calendar

  Background:
    Given I have a calendar titled Work

  Scenario: Viewing all the calendars
    Given I'm on the 'Calendars' page
    Then I should see 'Listing Calendars'

  Scenario: Viewing the calendar
    When I'm on the 'Work' calendar page
    Then I should see the title 'Work'
    And I should see "Mode"
    And the mode should be 'Week view'
    And the time mode should be 'Quarterly'
    And I should see the calendar:
    And I should see all the days of the week

  Scenario: Add an event to the Work calendar
    Given I'm on the 'Calendars' page
    When I click on 12pm on Monday
    Then I should see the "Add Event" dialog

