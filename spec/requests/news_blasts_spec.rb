require 'spec_helper'

describe "NewsBlasts" do
  describe "GET /news_blasts" do
    it "works!" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get news_blasts_path
      response.status.should be(200)
    end


    it "works! when you're logged in" do
    end
  end
end
