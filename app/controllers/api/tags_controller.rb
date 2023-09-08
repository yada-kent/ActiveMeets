module Api
  class TagsController < ApplicationController
    def index
      @tags = Tag.order(:tag)
      render json: @tags
    end
  end
end
