class BlogsController < ApplicationController
  def index
    @title = "Home"
    @blogs = Blog.all
  end

  def show
    @title = 'Show'
    @blog = Blog.find(params[:id])
  end

  def edit
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
