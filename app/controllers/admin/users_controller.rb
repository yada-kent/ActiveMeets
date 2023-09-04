class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def unsubscribe
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    redirect_to admin_user_path(@user), notice: "ユーザーの退会処理が完了しました"
  end

  def rejoin
    @user = User.find(params[:id])
    @user.update(is_deleted: false)
    redirect_to admin_user_path(@user), notice: "ユーザーの退会処理を取り消しました"
  end

end
