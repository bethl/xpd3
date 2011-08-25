require 'spec_helper'

describe "cmdlines/show.html.erb" do
  before(:each) do
    @cmdline = assign(:cmdline, stub_model(Cmdline,
      :cmd => "Cmd",
      :response => "Response"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cmd/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Response/)
  end
end
