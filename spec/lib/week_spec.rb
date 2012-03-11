require 'spec_helper'

describe Week do
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
  
  describe "#new" do

    subject { Week.new @week }

    it "should get all the events for that week" do
      subject.events.count.should == 3
    end
  end


  describe "days" do
    subject { Week.new @week }
    before do
      subject.time = @mon
    end

    its(:mon) { should == {:css_class=>"start_event", :text=>"Call Mr Johnson"} }

    it "should get the css_class" do
      subject.mon[:css_class].should == "start_event"
    end
  end

  describe "states" do

    subject { Week.new @week }

    describe "states of day cell" do
      context "event start point cell" do
        it 'should have events' do
          subject.time = @mon
          subject.start_event('mon').count.should == 1
        end
      end

      context "event has started cell" do
        it "should have events" do
          subject.time = (@mon + 15.minutes)
          subject.during_event('mon').count.should == 1
        end
      end

      context "event end's cell" do
        it "should have events" do
          subject.time = (@mon + 30.minutes)
          subject.end_event('mon').count.should == 1
        end
      end

    end
  end
end
