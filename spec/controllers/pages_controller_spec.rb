require 'spec_helper'

describe PagesController do

  describe "GET 'directions'" do
    it "should be successful" do
      get 'directions'
      response.should be_success
    end
  end

end
