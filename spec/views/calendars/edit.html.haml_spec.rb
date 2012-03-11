require 'spec_helper'

describe "calendars/edit" do
  before(:each) do
    @calendar = assign(:calendar, stub_model(Calendar,
      :title => "MyString",
      :ical => "MyString"
    ))
  end

=begin
  it "renders the edit calendar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => calendars_path(@calendar), :method => "post" do
      assert_select "input#calendar_title", :name => "calendar[title]"
      assert_select "input#calendar_ical", :name => "calendar[ical]"
    end
  end
=end
end
