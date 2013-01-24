class BlogsController < ApplicationController
  def index
    @title = "Home"
    @blogs = Blog.all
  end

  def show
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
