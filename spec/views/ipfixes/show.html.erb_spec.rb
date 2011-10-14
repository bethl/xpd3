require 'spec_helper'

describe "ipfixes/show.html.erb" do
  before(:each) do
    @ipfix = assign(:ipfix, stub_model(Ipfix,
      :host => "Host",
      :ip => "Ip"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Host/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ip/)
  end
end
