class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
    @date_today = Date.today
    respond_to do |format|
      format.js
    end
  end 

  def create
  end

end
