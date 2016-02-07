class CatalogController < ApplicationController

  before_action :set_all, only: [:filter, :index, :show]

  def set_all
    @factories = Factory.all
    @zones = Zone.all
    @types = Type.all
    @sizes = Tile.pluck(:width, :length).uniq
  end

  def index
    @goods = Collection.all
    if params
      @goods = @goods.joins(:types).where(types: { id: params[:types] }) if params[:types]
      @goods = @goods.joins(:factory).where(factories: { id: params[:factories] }) if params[:factories]
      @goods = @goods.joins(:zones).where(zones: { id: params[:zones] }) if params[:zones]

      if params[:sizes]
        sizes = '(' + params[:sizes].map{ |s| a = s.split('X'); "(#{a.first}, #{a.second})" }.join(', ')
        @goods = @goods.joins(:tiles).where("tiles.width, tiles.length) IN #{sizes}").group(:id)
      end      
    end
    number = Collection::PER_PAGE * (params[:pages] ? params[:pages].to_i : 1)
    @show_more = @goods.count > number
    @goods = @goods.limit(number)
  end

  def show
    # @factories = Factory.all
    # @zones = Zone.all
    # @types = Type.all

    @course = Currency.last.course
    @good = Collection.find(params[:id])

    @tiles = @good.tiles
    number = Collection::PER_PAGE * (params[:pages] ? params[:pages].to_i : 1)
    @show_more = @tiles.count > number
    @tiles = @tiles.limit(number)

    # if params[:start_id]
    #   @tiles = @good.tiles.where('id < ?', params[:start_id]).limit(9)
    # else
    #   @tiles = @good.tiles.limit(9)
    # end
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end
  def create
    # binding.pry
  end
end
