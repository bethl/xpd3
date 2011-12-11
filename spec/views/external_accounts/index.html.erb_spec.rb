require 'spec_helper'

describe "external_accounts/index.html.erb" do
  before(:each) do
    assign(:external_accounts, [
      stub_model(ExternalAccount,
        :name => "Name",
        :link => "Link",
        :username => "Username",
        :password => "Password"
      ),
      stub_model(ExternalAccount,
        :name => "Name",
        :link => "Link",
        :username => "Username",
        :password => "Password"
      )
    ])
  end

  it "renders a list of external_accounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
