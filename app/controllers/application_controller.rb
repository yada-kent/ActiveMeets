class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.is_deleted
      '/user_deleted.html'
    else
      super
    end
  end
end
