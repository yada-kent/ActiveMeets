# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController


  def create
    # 退会済みのユーザーの場合
    user = User.find_by(email: params[:user][:email])
    if user && user.is_deleted?
      redirect_to user_deleted_path and return
    end


    super
  end

end
