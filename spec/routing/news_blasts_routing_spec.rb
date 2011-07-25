require "spec_helper"

describe NewsBlastsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/news_blasts" }.should route_to(:controller => "news_blasts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/news_blasts/new" }.should route_to(:controller => "news_blasts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/news_blasts/1" }.should route_to(:controller => "news_blasts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/news_blasts/1/edit" }.should route_to(:controller => "news_blasts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/news_blasts" }.should route_to(:controller => "news_blasts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/news_blasts/1" }.should route_to(:controller => "news_blasts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/news_blasts/1" }.should route_to(:controller => "news_blasts", :action => "destroy", :id => "1")
    end

  end
end
