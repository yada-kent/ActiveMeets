class Public::LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.build(post: @post)
    if @like.save
      redirect_to @post, notice: 'いいねしました'
    else
      redirect_to @post, alert: 'いいねに失敗しました'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
    redirect_to @post, notice: 'いいねを取り消しました'
  end
  
end
