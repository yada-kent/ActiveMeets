class Users::SessionsController < Devise::SessionsController

  def new_guest
    user = User.find_or_create_by(email: 'guest@example.com')
      user.password = SecureRandom.urlsafe_base64 #ランダムな64文字のパスワードを生成する
      user.name = 'ゲストユーザー' #ゲストユーザーの名前を設定
      user.save!

    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました'
  end
end