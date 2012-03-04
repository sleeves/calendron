class DisplayACalendar < Spinach::FeatureSteps
  feature 'Display a calendar'
  Given 'I have a calendar titled Work' do
    work_calendar = Factory(:calendar, :title => "Work")
  end

  When 'I\'m on the \'Work\' calendar page' do
    visit '/calendars/work'
  end

  Then 'I should see the title \'Work\'' do
    page.has_content?('Work').should == true
  end
end

