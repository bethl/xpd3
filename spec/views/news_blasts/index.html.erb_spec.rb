require 'spec_helper'

describe "news_blasts/index.html.erb" do
  before(:each) do
    assign(:news_blasts, [
      stub_model(NewsBlast,
        :headline => "Headline",
        :content => "Content"
      ),
      stub_model(NewsBlast,
        :headline => "Headline",
        :content => "Content"
      )
    ])
  end

  it "renders a list of news_blasts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Headline".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
