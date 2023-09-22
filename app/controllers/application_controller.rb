class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # deviseにカスタムフィールド（:name, :introduction, :avatarを許可)

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.is_deleted
      '/user_deleted.html'
    else
      super
    end
  end

  protected

  def after_sign_in_path_for(resource)
    posts_path  # 投稿一覧画面へのパス
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction, :avatar, :email, :password, :password_confirmation])
  end

end
