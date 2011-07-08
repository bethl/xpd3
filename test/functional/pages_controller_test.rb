require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get gallery" do
    get :gallery
    assert_response :success
  end

  test "should get specials" do
    get :specials
    assert_response :success
  end

  test "should get products" do
    get :products
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end

end
