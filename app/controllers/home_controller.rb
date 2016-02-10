class HomeController < ApplicationController
	def index
		@news = News.recent
		@entry = Entry.new
		@collections = Collection.where(home_page: true).limit(3)
		@slider_images = Slider.order(priority: :desc)
		# @collections = Collection.where(new: 'true').limit(3).order("RANDOM()")
	end
end
