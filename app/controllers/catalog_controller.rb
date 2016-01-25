class CatalogController < ApplicationController
	def index
		@factories = Factory.all
	  @zones = Zone.all
		@types = Type.all
		if params[:width_max]
			@width_max = params[:width_max].to_i
			@width_min = params[:width_min].to_i
		  @length_max = params[:length_max].to_i
			@length_min = params[:length_min].to_i
			@type = params[:type]
			@zone = params[:zone]
			@factory = params[:factory]	
			if @type == 'Тип помещения'
				if @zone == 'Назначение'	
					if @factory == 'Производитель'
						@goods = Collection.joins(:tiles).where('tiles.width' => @width_min..@width_max, 'tiles.length' => @length_min..@length_max).group(:id)
					else
						@goods = Collection.joins(:tiles).where('tiles.width' => @width_min..@width_max, 'tiles.length' => @length_min..@length_max).group(:id).joins(:factory).where(:factories => {:name => @factory})
					end
				else
					if @factory = 'Производитель'			
						@goods = Collection.joins(:tiles).where('tiles.width' => @width_min..@width_max, 'tiles.length' => @length_min..@length_max).group(:id).joins(:zones).where(:zones => {:name => @zone})
					else
						@goods = Collection.joins(:tiles).where('tiles.width' => @width_min..@width_max, 'tiles.length' => @length_min..@length_max).group(:id).joins(:zones).where(:zones => {:name => @zone}).joins(:factory).where(:factories => {:name => @factory})
					end
				end
			else
				if @zone == 'Назначение'
					if @factory == 'Производитель'
						@goods = Collection.joins(:tiles).where('tiles.width' => @width_min..@width_max, 'tiles.length' => @length_min..@length_max).group(:id).joins(:types).where(:types => {:name => @type})
					else	
						@goods = Collection.joins(:tiles).where('tiles.width' => @width_min..@width_max, 'tiles.length' => @length_min..@length_max).group(:id).joins(:factory).where(:factories => {:name => @factory}).joins(:types).where(:types => {:name => @type})
					end
				else
					if @factory == 'Производитель'
						@goods = Collection.joins(:tiles).where('tiles.width' => @width_min..@width_max, 'tiles.length' => @length_min..@length_max).group(:id).joins(:zones).where(:zones => {:name => @zone}).joins(:types).where(:types => {:name => @type})
					else
						@goods = Collection.joins(:tiles).where('tiles.width' => @width_min..@width_max, 'tiles.length' => @length_min..@length_max).group(:id).joins(:zones).where(:zones => {:name => @zone}).joins(:types).where(:types => {:name => @type}).joins(:factory).where(:factories => {:name => @factory})
					end
				end
			end
		else
			@flag = 1
			if params[:start_id]
				@goods = Collection.where('id < ?', params[:start_id]).limit(9)
			else
				@goods = Collection.limit(9)
			end
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
