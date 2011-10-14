require "spec_helper"

describe IpfixesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/ipfixes" }.should route_to(:controller => "ipfixes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/ipfixes/new" }.should route_to(:controller => "ipfixes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/ipfixes/1" }.should route_to(:controller => "ipfixes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/ipfixes/1/edit" }.should route_to(:controller => "ipfixes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/ipfixes" }.should route_to(:controller => "ipfixes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/ipfixes/1" }.should route_to(:controller => "ipfixes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/ipfixes/1" }.should route_to(:controller => "ipfixes", :action => "destroy", :id => "1")
    end

  end
end
