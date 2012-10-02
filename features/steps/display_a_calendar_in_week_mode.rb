#require 'ruby-debug'
class DisplayACalendarInWeekMode < Spinach::FeatureSteps
  feature 'Display a calendar'
  Given 'I have a calendar titled Work' do
    work_calendar = FactoryGirl.create(:calendar, :title => "Work")
  end

  Given 'I\'m on the \'Calendars\' page' do
    visit '/calendars'
  end

  When 'I\'m on the \'Work\' calendar page' do
    visit '/calendars/work'
  end

  Then 'I should see the title \'Work\'' do
    page.has_content?('Work').should == true
  end

  Then 'I should see \'Mode\'' do
    page.has_content?('Mode').should == true
  end

  And 'the date mode should be Weekly' do
    page.has_selector?(:css, '#week_view').should be_true
  end

  And 'the time mode should be \'Quarterly\'' do
    page.has_selector?(:css, '#display_quarters').should be_true
  end

  Then "I should see \'Listing Calendars\'" do
    page.has_content?('Listing Calendars').should == true
  end

  Then 'I should see the calendar' do

    page.should have_css 'table#calendar'

    calendar_table = "
     | Time  | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday |
      | 00:00 |        |         |           |          |        |          |        |
      | 00:15 |        |         |           |          |        |          |        |
      | 00:30 |        |         |           |          |        |          |        |
      | 00:45 |        |         |           |          |        |          |        |
      | 01:00 |        |         |           |          |        |          |        |
      | 01:15 |        |         |           |          |        |          |        |
      | 01:30 |        |         |           |          |        |          |        |
      | 01:45 |        |         |           |          |        |          |        |
      | 02:00 |        |         |           |          |        |          |        |
      | 02:15 |        |         |           |          |        |          |        |
      | 02:30 |        |         |           |          |        |          |        |
      | 02:45 |        |         |           |          |        |          |        |
      | 03:00 |        |         |           |          |        |          |        |
      | 03:15 |        |         |           |          |        |          |        |
      | 03:30 |        |         |           |          |        |          |        |
      | 03:45 |        |         |           |          |        |          |        |
      | 04:00 |        |         |           |          |        |          |        |
      | 04:15 |        |         |           |          |        |          |        |
      | 04:30 |        |         |           |          |        |          |        |
      | 04:45 |        |         |           |          |        |          |        |
      | 05:00 |        |         |           |          |        |          |        |
      | 05:15 |        |         |           |          |        |          |        |
      | 05:30 |        |         |           |          |        |          |        |
      | 05:45 |        |         |           |          |        |          |        |
      | 06:00 |        |         |           |          |        |          |        |
      | 06:15 |        |         |           |          |        |          |        |
      | 06:30 |        |         |           |          |        |          |        |
      | 06:45 |        |         |           |          |        |          |        |
      | 07:00 |        |         |           |          |        |          |        |
      | 07:15 |        |         |           |          |        |          |        |
      | 07:30 |        |         |           |          |        |          |        |
      | 07:45 |        |         |           |          |        |          |        |
      | 08:00 |        |         |           |          |        |          |        |
      | 08:15 |        |         |           |          |        |          |        |
      | 08:30 |        |         |           |          |        |          |        |
      | 08:45 |        |         |           |          |        |          |        |
      | 09:00 |        |         |           |          |        |          |        |
      | 09:15 |        |         |           |          |        |          |        |
      | 09:30 |        |         |           |          |        |          |        |
      | 09:45 |        |         |           |          |        |          |        |
      | 10:00 |        |         |           |          |        |          |        |
      | 10:15 |        |         |           |          |        |          |        |
      | 10:30 |        |         |           |          |        |          |        |
      | 10:45 |        |         |           |          |        |          |        |
      | 11:00 |        |         |           |          |        |          |        |
      | 11:15 |        |         |           |          |        |          |        |
      | 11:30 |        |         |           |          |        |          |        |
      | 11:45 |        |         |           |          |        |          |        |
      | 12:00 |        |         |           |          |        |          |        |
      | 12:15 |        |         |           |          |        |          |        |
      | 12:30 |        |         |           |          |        |          |        |
      | 12:45 |        |         |           |          |        |          |        |
      | 13:00 |        |         |           |          |        |          |        |
      | 13:15 |        |         |           |          |        |          |        |
      | 13:30 |        |         |           |          |        |          |        |
      | 13:45 |        |         |           |          |        |          |        |
      | 14:00 |        |         |           |          |        |          |        |
      | 14:15 |        |         |           |          |        |          |        |
      | 14:30 |        |         |           |          |        |          |        |
      | 14:45 |        |         |           |          |        |          |        |
      | 15:00 |        |         |           |          |        |          |        |
      | 15:15 |        |         |           |          |        |          |        |
      | 15:30 |        |         |           |          |        |          |        |
      | 15:45 |        |         |           |          |        |          |        |
      | 16:00 |        |         |           |          |        |          |        |
    "
  end

  And 'I should see all the days of the week' do
    page.should have_content 'Time'
    page.should have_content 'Monday'
    page.should have_content 'Tuesday'
    page.should have_content 'Wednesday'
    page.should have_content 'Thursday'
    page.should have_content 'Friday'
  end

  When 'I click on 12pm on Monday' do
    find("#0000 .mon").click
  end

  Then 'I should not see the "Add Event" dialog' do
    page.should have_css("#add_event.hidden")
  end

  Then 'I should see the "Add Event" dialog' do
    page.should_not have_css("#add_event.hidden")
  end

  And 'I should see an event stub for 12pm on Monday' do
    page.should have_css "#0000 .event_stub.mon"
  end

end

