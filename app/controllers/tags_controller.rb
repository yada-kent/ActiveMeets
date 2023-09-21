class TagsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tags = Tag.all
  end

def create
  @tag = Tag.new(tag_params)
  if @tag.save
    redirect_to tags_path, notice: 'タグが追加されました'
  else
    render :index
  end
end


private

  def tag_params
    { tag: params[:tag] }
  end

end