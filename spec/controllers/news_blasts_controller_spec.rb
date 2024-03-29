require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe NewsBlastsController do

  def mock_news_blast(stubs={})
    @mock_news_blast ||= mock_model(NewsBlast, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all news_blasts as @news_blasts" do
      NewsBlast.stub(:all) { [mock_news_blast] }
      get :index
      assigns(:news_blasts).should eq([mock_news_blast])
    end
  end

  describe "GET show" do
    it "assigns the requested news_blast as @news_blast" do
      NewsBlast.stub(:find).with("37") { mock_news_blast }
      get :show, :id => "37"
      assigns(:news_blast).should be(mock_news_blast)
    end
  end

  describe "GET new" do
    it "assigns a new news_blast as @news_blast" do
      NewsBlast.stub(:new) { mock_news_blast }
      get :new
      assigns(:news_blast).should be(mock_news_blast)
    end
  end

  describe "GET edit" do
    it "assigns the requested news_blast as @news_blast" do
      NewsBlast.stub(:find).with("37") { mock_news_blast }
      get :edit, :id => "37"
      assigns(:news_blast).should be(mock_news_blast)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created news_blast as @news_blast" do
        NewsBlast.stub(:new).with({'these' => 'params'}) { mock_news_blast(:save => true) }
        post :create, :news_blast => {'these' => 'params'}
        assigns(:news_blast).should be(mock_news_blast)
      end

      it "redirects to the created news_blast" do
        NewsBlast.stub(:new) { mock_news_blast(:save => true) }
        post :create, :news_blast => {}
        response.should redirect_to(news_blast_url(mock_news_blast))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved news_blast as @news_blast" do
        NewsBlast.stub(:new).with({'these' => 'params'}) { mock_news_blast(:save => false) }
        post :create, :news_blast => {'these' => 'params'}
        assigns(:news_blast).should be(mock_news_blast)
      end

      it "re-renders the 'new' template" do
        NewsBlast.stub(:new) { mock_news_blast(:save => false) }
        post :create, :news_blast => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested news_blast" do
        NewsBlast.stub(:find).with("37") { mock_news_blast }
        mock_news_blast.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :news_blast => {'these' => 'params'}
      end

      it "assigns the requested news_blast as @news_blast" do
        NewsBlast.stub(:find) { mock_news_blast(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:news_blast).should be(mock_news_blast)
      end

      it "redirects to the news_blast" do
        NewsBlast.stub(:find) { mock_news_blast(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(news_blast_url(mock_news_blast))
      end
    end

    describe "with invalid params" do
      it "assigns the news_blast as @news_blast" do
        NewsBlast.stub(:find) { mock_news_blast(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:news_blast).should be(mock_news_blast)
      end

      it "re-renders the 'edit' template" do
        NewsBlast.stub(:find) { mock_news_blast(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested news_blast" do
      NewsBlast.stub(:find).with("37") { mock_news_blast }
      mock_news_blast.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the news_blasts list" do
      NewsBlast.stub(:find) { mock_news_blast }
      delete :destroy, :id => "1"
      response.should redirect_to(news_blasts_url)
    end
  end

end
