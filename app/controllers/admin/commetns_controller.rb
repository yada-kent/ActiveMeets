class Admin::CommetnsController < ApplicationController
   before_action :authenticate_user!
    before_action :ensure_admin

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to admin_post_path(@comment.post), notice: 'コメントを削除しました'
    end

    private

    def ensure_admin
      redirect_to root_path, alert: '権限がありません' unless current_user.admin?
    end
end
