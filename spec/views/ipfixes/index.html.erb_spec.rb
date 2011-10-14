require 'spec_helper'

describe "ipfixes/index.html.erb" do
  before(:each) do
    assign(:ipfixes, [
      stub_model(Ipfix,
        :host => "Host",
        :ip => "Ip"
      ),
      stub_model(Ipfix,
        :host => "Host",
        :ip => "Ip"
      )
    ])
  end

  it "renders a list of ipfixes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Host".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
  end
end
