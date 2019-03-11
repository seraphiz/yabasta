class UsersController < ApplicationController
  def index
  end
  def aproved_posts
    @posts = current_user.posts.where(active: true)
  end

  def posts_to_aprove
    @posts = current_user.posts.where(active: false)
  end 

end
