class PostsController < ApplicationController
  def home
    @posts 
  end

  def index
  end 

  def new
    @post = Post.new
    @date_today = Date.today
    @title_tag_select = Tag.pluck(:title, :id)
    @period_for_select = ["Prefiero no decirlo", "Mañana", "Tarde", "Noche", "Madrugada"]
    respond_to :js
  end 

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path, notice: "Relato agreagado con exito"
  end


  private

  def post_params
    params.require(:post).permit(:tag_id, :name, :date, :period_of_day, :age, :content, :address, :anonymous)
  end 
end
