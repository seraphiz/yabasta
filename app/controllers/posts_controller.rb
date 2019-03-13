class PostsController < ApplicationController
  def home
  end

  def index
  #   respond_to do |format|
  #     if !params[:tipocrimen].nil?
  #       if params[:tipocrimen].blank?
  #         @posts = Post.all
  #       else
  #        @tags = Tag.where('title LIKE ?', "%#{params[:tipocrimen]}%")
  #       end
  #       format.js
  #     else
  #       @posts = Post.all
  #       format.html
  #     end
  #   end

    respond_to do |format|
      if !params[:buscador].nil?
        if params[:buscador].blank?
          @posts = Post.all
        else
          @posts = Post.where('period_of_day LIKE ?', "%#{params[:buscador]}%")
        end
        format.js
      else
        @posts = Post.order("id DESC")
        format.html
      end
    end
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
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
    end
  end 

  def update
    @post = Post.find(params[:id])
    if @post.anonymous == false
      @post.anonymous = true
    else
      @post.anonymous = false
    end 
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
