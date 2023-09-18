class ApplicationController < ActionController::Base
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
end
