class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile]
  #ユーザープロフィールの閲覧はログインしているときのみ可能

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_path(@user), notice: "プロフィールを更新しました。"
    else
      render :edit
    end
  end

  def
    confirm_delete
  end

  def unsubscribe
    @user = current_user
    @user.update(is_deleted: true, original_name: current_user.name, name: "退会済みユーザー")
    #退会する際、元の名前をoriginal_nameカラムに保存する
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  def likes
    @user = current_user
    @liked_posts = @user.liked_posts
  end

  def profile
    @user = User.find(params[:id])
  end

  def followees
    @user = User.find(params[:id])
    @followees = @user.followees
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction)
  end

end
