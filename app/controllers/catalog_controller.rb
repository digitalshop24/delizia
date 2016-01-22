class CatalogController < ApplicationController
	def index
		if params[:start_id]
			@goods = Collection.where('id < ?', params[:start_id]).limit(9)
		else
      		@goods = Collection.limit(9)
    	end
    	respond_to do |format|
      	format.html
      	format.js
      end
	end

	def show
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
end
