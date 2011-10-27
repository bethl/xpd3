require 'spec_helper'

describe "suppliers/index.html.erb" do
  before(:each) do
    assign(:suppliers, [
      stub_model(Supplier,
        :company_name => "Company Name",
        :website => "Website",
        :account => "Account",
        :username => "Username",
        :password => "Password"
      ),
      stub_model(Supplier,
        :company_name => "Company Name",
        :website => "Website",
        :account => "Account",
        :username => "Username",
        :password => "Password"
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Account".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
