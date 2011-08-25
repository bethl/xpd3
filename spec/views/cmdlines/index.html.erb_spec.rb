require 'spec_helper'

describe "cmdlines/index.html.erb" do
  before(:each) do
    assign(:cmdlines, [
      stub_model(Cmdline,
        :cmd => "Cmd",
        :response => "Response"
      ),
      stub_model(Cmdline,
        :cmd => "Cmd",
        :response => "Response"
      )
    ])
  end

  it "renders a list of cmdlines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cmd".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Response".to_s, :count => 2
  end
end
