class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @post = Post.find(params[:id])
  end
  
  def edit
  end
  

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_user_path(post.user), notice: '投稿を削除しました'
  end
end
