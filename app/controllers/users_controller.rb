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

  def desactive
    @user = current_user
    @user.comments.each do |c|
      c.anonymous = 1
    end 
    @user.posts.each do |r|
      r.anonymous = true
    end
    @user.active = false
    @user.save
    reset_session
    redirect_to root_path, notice: "Cuenta desactivada exitosamente"
  end 
  
  def destroy
    @user = User.find(current_user.id)
    @user.delete
    redirect_to root_path, notice: "Cuenta borrada exitosamente"
  end 

end
