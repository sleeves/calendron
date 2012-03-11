require 'spec_helper'

describe Week do
  describe "#new" do
    before do
      @mon = "2012-03-05 00:00:00 +0000".to_datetime
      @tues = "2012-03-06 00:00:00 +0000".to_datetime
      @wed = "2012-03-07 00:00:00 +0000".to_datetime
      @thurs = "2012-03-08 00:00:00 +0000".to_datetime
      @fri = "2012-03-09 00:00:00 +0000".to_datetime
      @sat = "2012-03-10 00:00:00 +0000".to_datetime
      @sun = "2012-03-11 00:00:00 +0000".to_datetime
      @week = @sun.to_date.beginning_of_week

      @following_sun = "2012-03-12 00:00:00 +0000".to_datetime

      @event = Factory(:event, :start_point => @mon, :end_point => (@mon + 30.minutes))
      @event2 = Factory(:event, :start_point => @tues, :end_point => (@tues + 45.minutes))
      @event3 = Factory(:event, :start_point => (@wed + 240.minutes), :end_point => (@wed + 480.minutes))
      @out_of_scope_event = Factory(:event, :start_point => (@following_sun + 240.minutes), :end_point => (@following_sun + 480.minutes))
    end

    subject { Week.new @week }

    it "should get all the events for that week" do
      subject.events.count.should == 3
    end
  end
end
