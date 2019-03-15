class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[update moderator_aprove destroy]
  load_and_authorize_resource


  def home
  end

  def index
        @posts = Post.order("id DESC")
  end 

  def new
    @post = Post.new
    @date_today = Date.today
    @title_tag_select = Tag.pluck(:title, :id)
    @period_for_select = ["Prefiero no decirlo", "Mañana", "Tarde", "Noche", "Madrugada"]
    respond_to :js
  end 

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new

    @hash = Gmaps4rails.build_markers(@post) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
     end
  end 

  def create

    @post = Post.new(post_params)
    @post.user_id = current_user.id if current_user || nil
    if @post.user_id == nil
      @post.anonymous = true
    else 
    end 
    @post.save
    redirect_to tag_path(@post.tag_id), notice: "Relato enviado para aprobacion con exito! Si fuiste victima de #{@post.tag.title}, lea más abajo"
  end

  def map
    @posts = Post.all
    @hash = []
    @posts.each do |p|
      @hash.push({ latitude: p.latitude, longitude: p.longitude, id: p.id, title: p.tag.title })
    end 
  end

  def info
    @post = Post.find(params[:id])
    respond_to :js
  end

  def update
    @post = Post.find(params[:id])
    @post.update(anonymous: !@post.anonymous)
    respond_to :js
  end

  def moderator_aprove
    @post = Post.find(params[:id])
    @post.active = true
    @post.save
    respond_to do |format|
      format.js {  }
    end
  end 
  

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.js
    end
  end


  private

  def post_params
    params.require(:post).permit(:tag_id, :name, :date, :period_of_day, :content, :age, :anonymous, :address)
  end 
end
