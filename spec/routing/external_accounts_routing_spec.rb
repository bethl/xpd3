require "spec_helper"

describe ExternalAccountsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/external_accounts" }.should route_to(:controller => "external_accounts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/external_accounts/new" }.should route_to(:controller => "external_accounts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/external_accounts/1" }.should route_to(:controller => "external_accounts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/external_accounts/1/edit" }.should route_to(:controller => "external_accounts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/external_accounts" }.should route_to(:controller => "external_accounts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/external_accounts/1" }.should route_to(:controller => "external_accounts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/external_accounts/1" }.should route_to(:controller => "external_accounts", :action => "destroy", :id => "1")
    end

  end
end
