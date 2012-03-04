Feature: Display a calendar
  In order to know what day it is
  As a developer
  I want to see the calendar

  Scenario: Viewing the calendar
    Given I have a calendar called Work
    When I'm on the 'Work' calendar page
    Then I should see the title 'Work'

