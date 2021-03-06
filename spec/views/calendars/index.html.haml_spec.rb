require 'spec_helper'

describe "calendars/index" do
  before(:each) do
    assign(:calendars, [
      stub_model(Calendar,
        :title => "Title",
        :ical => "Ical"
      ),
      stub_model(Calendar,
        :title => "Title",
        :ical => "Ical"
      )
    ])
  end
=begin
  it "renders a list of calendars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ical".to_s, :count => 2
  end
=end
end
