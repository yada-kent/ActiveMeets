class TagsController < ApplicationController
  def new
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to new_post_path, notice: '新しいタグを追加しました。'
    else
      render :new
    end
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end

  private

  def tag_params
    params.require(:tag).permit(:tag)
  end
end
