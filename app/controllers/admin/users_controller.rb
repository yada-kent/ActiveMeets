class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts #このユーザーの投稿を取得
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'ユーザー情報が更新されました'
    else
      render :edit
    end
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :is_deleted) # ここに許可したいパラメータを追加
  end


end
