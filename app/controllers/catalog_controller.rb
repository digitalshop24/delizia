class CatalogController < ApplicationController
	def index
		if params[:one]
			width_max = params[:width][:max].to_i
			width_min = params[:width][:min].to_i
		  length_max = params[:length][:max].to_i
			length_min - params[:length][:min].to_i
			type = params[:type]
			zone = params[:zone]
			factory = params[:factory]
		end
			@factories = Factory.all
			@zones = Zone.all
			@types = Type.all
			if params[:start_id]
				@goods = Collection.joins(:tiles).where('tiles.width' => width_min..width_max, 'tiles.length' => length_min..length_max).where('id < ?', params[:start_id]).limit(9)
			else
      	@goods = Collection.limit(9)
    	end
    	respond_to do |format|
      	format.html
      	format.js
      end
	end

	def show
		@course = Currency.last.course
		@good = Collection.find(params[:id])
		if params[:start_id]
			@tiles = @good.tiles.where('id < ?', params[:start_id]).limit(9)
		else
			@tiles = @good.tiles.limit(9)
		end
		respond_to do |format|
      format.html
      format.js
    end
	end
	def create
		binding.pry
	end
end
