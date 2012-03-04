class DisplayACalendar < Spinach::FeatureSteps
  feature 'Display a calendar'
  Given 'I have a calendar titled Work' do
    work_calendar = Factory(:calendar, :title => "Work")
  end

  When 'I\'m on the \'Work\' calendar page' do
    raise 'step not implemented'
  end

  Then 'I should see the title \'Work\'' do
    raise 'step not implemented'
  end
end

