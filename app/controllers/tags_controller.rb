class TagsController < ApplicationController
  before_action :set_all, only: [:show]

  def show
    @tag = Tag.find_by_url(params[:url])
    if @tag
      render :show
    else
      render file: "#{Rails.root}/public/404", layout: false, status: 404
    end
  end
end