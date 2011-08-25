require "spec_helper"

describe CmdlinesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/cmdlines" }.should route_to(:controller => "cmdlines", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/cmdlines/new" }.should route_to(:controller => "cmdlines", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/cmdlines/1" }.should route_to(:controller => "cmdlines", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/cmdlines/1/edit" }.should route_to(:controller => "cmdlines", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/cmdlines" }.should route_to(:controller => "cmdlines", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/cmdlines/1" }.should route_to(:controller => "cmdlines", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/cmdlines/1" }.should route_to(:controller => "cmdlines", :action => "destroy", :id => "1")
    end

  end
end
