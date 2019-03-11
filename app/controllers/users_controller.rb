class UsersController < ApplicationController
  def index
  end
  def aproved_posts
    @posts = current_user.posts.where(active: true)
  end

end
