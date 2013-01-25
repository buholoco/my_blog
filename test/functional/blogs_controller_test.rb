require 'test_helper'

class BlogsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "index should have the right title" do
    get :index
    assert assigns(:title), "should assigns 'title'"
    assert_select 'title', :text => 'Home'
  end
  
  test "index should assign blogs" do
    get :index
    assert assigns(:blogs), "should assigns blogs"
  end

  test "index should list blogs" do
    get :index
    assert_select 'section#blogs'
    assigns(:blogs).each do |blog|
      assert_select "article#blog_#{blog.id}"
      assert_select "div#blog_title"
      assert_select "div#blog_content"
    end

  end

  test "should get show" do
    get :show, :id => blogs(:one).id
    assert_response :success
  end

  test "should assign blog" do
    get :show, :id => blogs(:one).id
    assert assigns(:blog), "show should assign @blog"
  end

  test "show should have the right title" do
    get :show, :id => blogs(:one).id
    assert_select 'title', :text => /Show/
  end

  test "show should show a blog" do
   get :show, :id => blogs(:one).id
   assert_select 'section#blog' do
       assert_select 'div#title', :text => blogs(:one).title
       assert_select 'div#content', :text => blogs(:one).content
   end
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
