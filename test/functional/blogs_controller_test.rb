require 'test_helper'

class BlogsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should have the right title" do
    get :index
    assert assigns(:title), "should assigns 'title'"
    assert_select 'title', :text => 'Home'
  end
  
  test "should assign blogs" do
    get :index
    assert assigns(:blogs), "should assigns blogs"
  end

  test "should list blogs" do
    get :index
    assert_select 'blogs'
  end

  test "should get show" do
    get :show, :id => 1
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => 1
    assert_response :success
  end

  test "should get new" do
    get :new, :id => 1
    assert_response :success
  end

  test "should get create" do
    post :create
    assert_response :success
  end

  test "should get update" do
    put :update, :id => 1 
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy, :id => 1 
    assert_response :success
  end

end
