module AdminNamespace
  class TagsController < ApplicationController
    before_action :authenticate_admin!

    def index
      @tags = Tag.all
    end

    def destroy
      @tag = Tag.find(params[:id])
      @tag.destroy
      redirect_to admin_namespace_tags_path, notice: 'タグが削除されました'
    end
  end
end
