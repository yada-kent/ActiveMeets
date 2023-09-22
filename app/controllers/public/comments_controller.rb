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

  def edit
    @comment = Comment.find(params[:id])
    # セキュリティのため、コメントの所有者かどうか確認
    unless @comment.user == current_user
      redirect_to @comment.post, alert: '不正なアクセスです。'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.user == current_user && @comment.update(comment_params)
      redirect_to @comment.post, notice: 'コメントを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    # セキュリティのため、現在のユーザーがコメントのオーナーか確認することを推奨
    if @comment.user == current_user
      @comment.destroy
      redirect_to request.referrer, notice: 'コメントが削除されました'
    else
      redirect_to request.referrer, alert: 'コメントを削除する権限がありません'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
