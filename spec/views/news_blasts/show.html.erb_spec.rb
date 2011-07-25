require 'spec_helper'

describe "news_blasts/show.html.erb" do
  before(:each) do
    @news_blast = assign(:news_blast, stub_model(NewsBlast,
      :headline => "Headline",
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Headline/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
  end
end
