class Admin::PostsController < ApplicationController
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_user_path(post.user), notice: '投稿を削除しました'
  end
end
