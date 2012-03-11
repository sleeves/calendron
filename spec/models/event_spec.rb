require 'spec_helper'

describe Event do
  describe "@event.day" do
    subject { Factory(:event) }
    its(:day) { should == 'mon' }
  end
end
