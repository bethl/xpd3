require 'spec_helper'

describe "ipfixes/edit.html.erb" do
  before(:each) do
    @ipfix = assign(:ipfix, stub_model(Ipfix,
      :host => "MyString",
      :ip => "MyString"
    ))
  end

  it "renders the edit ipfix form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ipfixes_path(@ipfix), :method => "post" do
      assert_select "input#ipfix_host", :name => "ipfix[host]"
      assert_select "input#ipfix_ip", :name => "ipfix[ip]"
    end
  end
end
