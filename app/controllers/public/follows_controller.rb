class Public::FollowsController < ApplicationController
  before_action :set_user

  def create
    follow = current_user.active_follows.new(followee_id: @user.id)
    if follow.save
      redirect_to users_path, notice: 'ユーザーをフォローしました'
    else
      redirect_to users_path, alert: 'このユーザーをフォローできません'
    end
  end

  def destroy
    follow = current_user.active_follows.find_by(followee_id: @user.id)
    follow.destroy if follow
    redirect_to users_path, notice: 'ユーザーのフォローを解除しました'
  end

  private

  def set_user
    @user = User.find(params[:followed_id])
  end
end
