class HomeController < ApplicationController
	def index
		@collections = Collection.where(:new => 'true').limit(3).order("RANDOM()")
	end
end
