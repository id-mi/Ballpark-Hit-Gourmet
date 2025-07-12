class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment, only: [:destroy]
    before_action :ensure_comment_owner, only: [:destroy]

    def create
        post = Post.find(params[:post_id])
        comment = current_user.comments.new(comment_params)
        comment.post_id = post.id
        if comment.save
            redirect_to post_path(post)
        else
            redirect_to post_path(post), alert: 'コメントの投稿に失敗しました'
        end
    end

    def destroy
        post = @comment.post
        @comment.destroy
        redirect_to post_path(post), 
    end

    private
    
    def set_comment
        @comment = Comment.find(params[:id])
    end

    def ensure_comment_owner
        unless current_user == @comment.user
            redirect_to post_path(@comment.post), alert: 'このコメントを削除する権限がありません'
        end
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end
