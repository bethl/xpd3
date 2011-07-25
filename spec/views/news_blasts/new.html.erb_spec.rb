require 'spec_helper'

describe "news_blasts/new.html.erb" do
  before(:each) do
    assign(:news_blast, stub_model(NewsBlast,
      :headline => "MyString",
      :content => "MyString"
    ).as_new_record)
  end

  it "renders new news_blast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_blasts_path, :method => "post" do
      assert_select "input#news_blast_headline", :name => "news_blast[headline]"
      assert_select "input#news_blast_content", :name => "news_blast[content]"
    end
  end
end
