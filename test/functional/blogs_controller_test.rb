require 'test_helper'

class BlogsControllerTest < ActionController::TestCase

  def setup
    @attr = {:title => 'Valid Title', :content => 'Valid Content'}
    @attr_invalid = {:title => '', :content => ''}
  end

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
  ## failure
  test "new should render new" do
    get :new, :blog => @attr_invalid
    assert_template 'new'
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

  ###
  ## success
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
  # create
  test "should get create" do
    post :create
    assert_response :success
  end

  test "create should assing blog" do
    post :create, :blog => @attr
    assert assigns(:blog)
  end

  ###
  ## failure
  test "create should render new" do
    post :create, :blog => @attr_invalid
    assert_template 'new' 
  end

  test "create should no add a new blog" do
    assert_no_difference 'Blog.count' do
      post :create, :blog => @attr_invalid
    end 
  end

  test "create should show errors" do
    get :create, :blog => @attr_invalid
    assert_select 'div.error' 
  end

  ###
  ## success
  test "create should add a new blog" do
    assert_difference 'Blog.count', 1 do
      post :create, :blog => @attr
    end
  end

  test "create should redirect to blog" do
    post :create, :blog => @attr
    assert_redirected_to blog_path(assigns(:blog))
  end

  ###
  # update
  test "update should assign title" do
    put :update, :id => blogs(:one).id
    assert assigns(:title)
  end

  ###
  ## Failure
  test "update should render edit" do
    put :update, :id => blogs(:one).id, :blog => @attr_invalid
    assert_template 'edit' 
  end

  test "update should render partial _form" do
    put :update, :id => blogs(:one).id, :blog => @attr_invalid
    assert_template :partial => '_form'
    assert_select 'form' do
      assert_select 'input[id=blog_title][type=text]'
      assert_select 'textarea[id=blog_content]'
      assert_select 'input[type=submit]'
    end
  end

  test "update should show errors" do
    put :update, :id => blogs(:one).id, :blog => @attr_invalid
    assert_select 'div.error' 
  end
  
  ###
  ## Success
  test "update should modify blog" do
    put :update, :id => blogs(:one).id, :blog => @attr
    blogs(:one).reload
    assert blogs(:one).title == @attr[:title]
    assert blogs(:one).content == @attr[:content]
  end

  test "update should redirect to show blog" do
    put :update, :id => blogs(:one).id, :blog => @attr
    assert_redirected_to blog_path(blogs(:one)) 
  end

  ###
  # destroy

  ###
  ## success
  test "should delete a blog" do
    assert_difference 'Blog.count', -1 do
      delete :destroy, :id => blogs(:one).id
    end
  end

  test "should redirect to blogs" do
    delete :destroy, :id => blogs(:one).id
    assert_redirected_to blogs_path
  end

end
