class TagsController < ApplicationController
  before_action :set_all, only: [:show]

  def show
    @tag = Tag.find_by_url(params[:url])
    if @tag
      render :show
    else
    	raise ActionController::RoutingError.new('Not Found')
    end
  end
end