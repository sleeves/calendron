#require 'ruby-debug'
class DisplayACalendar < Spinach::FeatureSteps
  feature 'Display a calendar'
  Given 'I have a calendar titled Work' do
    work_calendar = Factory(:calendar, :title => "Work")
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

  Then 'I should see \'Listing Calendars\'' do
    page.has_content?('Listing Calendars').should == true
  end

  Then 'I should see the calendar' do
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
end

