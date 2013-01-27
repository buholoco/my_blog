class BlogsController < ApplicationController
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
    @blog = Blog.find(params[:id])
  end

  def edit
    @title = "Edit"
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog])
      redirect_to @blog, :flash => {:success => "Blog updated!"}
    else
      render 'new'
    end
  end

  def create
  end

  def update
  end

  def destroy
  end
end
