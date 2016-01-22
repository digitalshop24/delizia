class FactoryController < ApplicationController
	def index
		@factories = Factory.all
	end
end
