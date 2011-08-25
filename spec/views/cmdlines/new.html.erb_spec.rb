require 'spec_helper'

describe "cmdlines/new.html.erb" do
  before(:each) do
    assign(:cmdline, stub_model(Cmdline,
      :cmd => "MyString",
      :response => "MyString"
    ).as_new_record)
  end

  it "renders new cmdline form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cmdlines_path, :method => "post" do
      assert_select "input#cmdline_cmd", :name => "cmdline[cmd]"
      assert_select "input#cmdline_response", :name => "cmdline[response]"
    end
  end
end
