require 'spec_helper'

describe "suppliers/show.html.erb" do
  before(:each) do
    @supplier = assign(:supplier, stub_model(Supplier,
      :company_name => "Company Name",
      :website => "Website",
      :account => "Account",
      :username => "Username",
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Website/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Account/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Username/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Password/)
  end
end
