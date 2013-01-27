require 'test_helper'

class BlogsControllerTest < ActionController::TestCase
  ###
  # index
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

  ###
  # new
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


  ###
  # show
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

  ###
  # edit
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

  ###
  ## Failure
  test "edit should render partial _form" do
    @attr = { :title => '', :content => ''}
    get :edit, :id => blogs(:one).id, :blog => @attr
    assert_template :partial => '_form'
    assert_select 'form' do
      assert_select 'input[id=blog_title][type=text]'
      assert_select 'textarea[id=blog_content]'
      assert_select 'input[type=submit]'
    end
  end
  
  ###
  ## Success
  test "edit should modify blog" do
    @attr = { :title => 'New title', :content => 'New Content'}
    get :edit, :id => blogs(:one).id, :blog => @attr
    blogs(:one).reload
    assert blogs(:one).title == @attr[:title]
    assert blogs(:one).content == @attr[:content]
  end

  ###
  # create
  test "should get create" do
    post :create
    assert_response :success
  end

  ###
  # update
  test "should get update" do
    put :update, :id => 1 
    assert_response :success
  end

  ###
  # destroy
  test "should get destroy" do
    delete :destroy, :id => 1 
    assert_response :success
  end

end
