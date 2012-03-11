require 'spec_helper'

describe Event do
  describe "WEEKDAYS" do
    it "should have weekdays" do
      Event::WEEKDAYS.should == ["sun", "mon", "tues", "wed", "thurs", "fri"]
    end
  end

  describe "@event.day" do
    subject { Factory(:event) }
    its(:day) { should == 'sun' }
  end
end
