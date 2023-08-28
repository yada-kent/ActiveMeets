class Public::FollowsController < ApplicationController
  before_action :set_user

  def create
    current_user.followings << @user
    redirect_to @user, notice: 'ユーザーをフォローしました'
  end

  def destroy
    current_user.followings.destroy(@user)
    redirect_to @user, notice: 'ユーザーのフォローを解除しました'
  end

  private

  def set_user
    @user = User.find(params[:followed_id])
  end
end
