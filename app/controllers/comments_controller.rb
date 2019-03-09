class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comments_params)
        @comment.user_id = current_user.id
        @comment.save
        
        respond_to do |format|
            format.js
        end
    end 

    private

    def comments_params
        params.require(:comment).permit(:content, :anonymous, :post_id)
    end 
end
