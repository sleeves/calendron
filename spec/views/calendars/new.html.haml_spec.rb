require 'spec_helper'

describe "calendars/new" do
  before(:each) do
    assign(:calendar, stub_model(Calendar,
      :title => "MyString",
      :ical => "MyString"
    ).as_new_record)
  end
=begin
  it "renders new calendar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => calendars_path, :method => "post" do
      assert_select "input#calendar_title", :name => "calendar[title]"
      assert_select "input#calendar_ical", :name => "calendar[ical]"
    end
  end
=end
end
