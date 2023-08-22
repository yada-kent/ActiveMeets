class Public::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @post, notice: 'コメントを追加しました'
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
