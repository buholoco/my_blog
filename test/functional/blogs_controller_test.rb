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
    assigns(:blogs).each do |blog|
      assert_select "article#blog_#{blog.id}"
      assert_select "div#blog_title_style"
      assert_select "div#blog_content_style"
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
    assert_select 'title', :text => /show/i
  end

  test "show should show a blog" do
   get :show, :id => blogs(:one).id
   assert_select 'section#blog' do
       assert_select 'div#blog_title_style', :text => blogs(:one).title
       assert_select 'div#blog_content_style', :text => blogs(:one).content
   end
  end

  test "should get edit" do
    get :edit, :id => blogs(:one).id
    assert_response :success
  end

  test "edit should assign title" do
    get :edit, :id => blogs(:one).id
    assert assigns(:title), 'should assign title'
  end

  test "edit should have the right title" do
   get :edit, :id => blogs(:one).id 
   assert_select 'title', :text => /Edit/i
  end

  test "blog partial _form elements" do
    get :new
    assert_template :partial => 'form', :locals =>{ :blog => blogs(:one)}
    assert_select 'form' do
      assert_select 'input[id=blog_title][type=text]'
      assert_select 'textarea[id=blog_content]'
      assert_select 'input[type=submit]'
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "new should assign title" do
    get :new
     assert_not_nil assigns(:title)
  end

  test "new should have the right title" do
    get :new
    assert_select 'title', :text => /new/i
  end

  test "new should assign blog" do
    get :new
    assert_not_nil assigns(:blog)
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
