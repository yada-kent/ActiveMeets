class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(10)
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
    @user = User.find(params[:id])
    if @user.email == 'guest@example.com'
      # ゲストユーザーの場合は、エラーメッセージを表示し、どこかのページ（例えば、ユーザーの詳細ページやユーザー一覧ページ）にリダイレクトする
      flash[:alert] = "ゲストユーザーの退会処理はできません。"
      redirect_to admin_user_path(@user) # 適切なリダイレクト先に調整してください
    else
      # ゲストユーザーでなければ、退会処理を進める
      @user.update(is_deleted: true, original_name: @user.name, name: "退会済みユーザー")
      flash[:notice] = "退会処理を実行しました。"
      redirect_to admin_users_path
    end
  end


  def rejoin
    @user = User.find(params[:id])
    @user.update(is_deleted: false, name: @user.original_name, original_name: nil)
    redirect_to admin_user_path(@user), notice: "ユーザーの退会処理を取り消しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :is_deleted, :avatar)
  end


end
