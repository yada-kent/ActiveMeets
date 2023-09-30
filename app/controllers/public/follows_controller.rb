class Public::FollowsController < ApplicationController
  before_action :set_user

  def create
    follow = current_user.active_follows.new(followee_id: @user.id)
    if follow.save
      redirect_to request.referer, notice: 'ユーザーをフォローしました'
    else
      redirect_to request.referer, alert: 'このユーザーをフォローできません'
    end
  end

  def destroy
    follow = current_user.active_follows.find_by(followee_id: @user.id)
    follow.destroy if follow
    redirect_to request.referer, notice: 'ユーザーのフォローを解除しました'
  end

  private

  def set_user
    @user = User.find(params[:followed_id])
  end
end