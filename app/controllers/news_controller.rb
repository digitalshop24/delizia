class NewsController < ApplicationController
	def index
		per_page = 4
		page = params[:page] ? params[:page].to_i : 1
		@news = News.order(created_at: :desc).limit(per_page).offset(per_page * (page - 1))
		@show_more = !@news.include?(News.first)
	end

	def show
		@news = News.find(params[:id])
	end
end
