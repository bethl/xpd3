require 'spec_helper'

describe "cmdlines/edit.html.erb" do
  before(:each) do
    @cmdline = assign(:cmdline, stub_model(Cmdline,
      :cmd => "MyString",
      :response => "MyString"
    ))
  end

  it "renders the edit cmdline form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cmdlines_path(@cmdline), :method => "post" do
      assert_select "input#cmdline_cmd", :name => "cmdline[cmd]"
      assert_select "input#cmdline_response", :name => "cmdline[response]"
    end
  end
end
