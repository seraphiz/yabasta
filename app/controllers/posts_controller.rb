class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
    @date_today = Date.today
    @title_tag_select = Tag.pluck(:title, :id)
    respond_to :js
  end 

  def create
  end

end
