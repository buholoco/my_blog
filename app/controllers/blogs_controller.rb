class BlogsController < ApplicationController
  before_filter :assign_blog, :only => [:show, :edit, :update, :destroy]

  def index
    @title = "Home"
    @blogs = Blog.all
  end

  def new
    @title = "New"
    @blog = Blog.new
  end

  def show
    @title = 'Show'
  end

  def edit
    @title = "Edit"
  end

  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      redirect_to @blog, :flash => {:success => "Blog created!"}
    else
      render 'new'
    end
  end

  def update
    @title = 'Update'
    if @blog.update_attributes(params[:blog])
      redirect_to @blog, :flash => {:success => "Blog updated!"}
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  private
  def assign_blog
    @blog = Blog.find(params[:id])
  end

end
