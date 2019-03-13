class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        @comment = Comment.new(comments_params)
        @comment.user_id = current_user.id
        @comment.post_id = params[:post_id]
        authorize! :create, @comment
        @comment.save
        
        respond_to do |format|
            format.js
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
        authorize! :destroy, @comment
        @comment.destroy
        respond_to do |format|
          format.js
        end
    end 

    private

    def comments_params
        params.require(:comment).permit(:content, :anonymous)
    end 
end
