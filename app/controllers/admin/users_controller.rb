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
    @user = User.find(params[:id])  # ここを変更
    @user.update(is_deleted: true, original_name: @user.name, name: "退会済みユーザー")
    # 退会する際、元の名前をoriginal_nameカラムに保存する
    flash[:notice] = "退会処理を実行しました"
    redirect_to admin_users_path  # 適切なリダイレクト先を設定
  end


  def rejoin
    @user = User.find(params[:id])
    @user.update(is_deleted: false, name: @user.original_name, original_name: nil)
    redirect_to admin_user_path(@user), notice: "ユーザーの退会処理を取り消しました"
  end


end
