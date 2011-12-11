require 'spec_helper'

describe "external_accounts/edit.html.erb" do
  before(:each) do
    @external_account = assign(:external_account, stub_model(ExternalAccount,
      :name => "MyString",
      :link => "MyString",
      :username => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit external_account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => external_accounts_path(@external_account), :method => "post" do
      assert_select "input#external_account_name", :name => "external_account[name]"
      assert_select "input#external_account_link", :name => "external_account[link]"
      assert_select "input#external_account_username", :name => "external_account[username]"
      assert_select "input#external_account_password", :name => "external_account[password]"
    end
  end
end
