require 'spec_helper'

describe "suppliers/edit.html.erb" do
  before(:each) do
    @supplier = assign(:supplier, stub_model(Supplier,
      :company_name => "MyString",
      :website => "MyString",
      :account => "MyString",
      :username => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit supplier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => suppliers_path(@supplier), :method => "post" do
      assert_select "input#supplier_company_name", :name => "supplier[company_name]"
      assert_select "input#supplier_website", :name => "supplier[website]"
      assert_select "input#supplier_account", :name => "supplier[account]"
      assert_select "input#supplier_username", :name => "supplier[username]"
      assert_select "input#supplier_password", :name => "supplier[password]"
    end
  end
end
