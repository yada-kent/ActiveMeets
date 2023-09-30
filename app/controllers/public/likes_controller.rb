class Public::LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.build(post: @post)
    if @like.save
      redirect_to request.referer, notice: 'いいねしました'
    else
      redirect_to request.referer, alert: 'いいねに失敗しました'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
    redirect_to request.referer, notice: 'いいねを取り消しました'
  end  
end