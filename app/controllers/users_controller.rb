class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[aproved_posts posts_to_aprove moderador]

  def index
  end
  def aproved_posts
    @posts = current_user.posts.where(active: true)
  end

  def posts_to_aprove
    @posts = current_user.posts.where(active: false)
  end 

  def moderator
    @posts = Post.where(active: false)
  end

end
