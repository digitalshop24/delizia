class CatalogController < ApplicationController

  before_action :set_all, only: [:filter, :index, :show, :search]

  def set_all
    @factories = Factory.all
    @zones = Zone.all
    @types = Type.all
    @sizes = FilterSize.all.order(priority: :desc)
    @prices = [
      ['0-9_999_999_999', 'любая'],
      ['0-500_000', 'до 500 тысяч'],
      ['500_000-1_000_000', 'от 500 до 1 млн.'],
      ['1_000_000-1_500_000', 'от 1 до 1,5 млн.'],
      ['1_500_000-9_999_999_999', 'более 1,5 млн.']
    ]
  end

  def search
    @goods = Collection.where('lower(name) LIKE lower(:query) OR lower(title) LIKE lower(:query)', query: "%#{params[:query]}%")
    render :index
  end

  def index
    @goods = Collection.all
    if params
      @goods = @goods.joins(:types).where(types: { id: params[:types] }) if params[:types]
      @goods = @goods.joins(:factory).where(factories: { id: params[:factories] }) if params[:factories]
      @goods = @goods.joins(:zones).where(zones: { id: params[:zones] }) if params[:zones]
      if params[:sizes]
        sizes = FilterSize.where(id: params[:sizes])
        widthes = sizes.map{|s| "(tiles.width BETWEEN #{s.min_width} AND #{s.max_width})"}.join(" OR ")
        lengthes = sizes.map{|s| "(tiles.length BETWEEN #{s.min_length} AND #{s.max_length})"}.join(" OR ")
        @goods = @goods.joins(:tiles).where("(#{widthes}) AND (#{lengthes})")
      end
      if params[:price]
        course = Currency.last.course.to_i
        price_min, price_max = params[:price].split('-').map{|i| i.to_i / course}
        @goods = @goods.joins(:tiles).where('tiles.price BETWEEN ? AND ?', price_min, price_max)
      end
    end
    @goods = @goods.group("collections.id")
    number = Collection::PER_PAGE * (params[:pages] ? params[:pages].to_i : 1)
    c = @goods.count.kind_of?(Fixnum) ? @goods.count : @goods.count.count
    @show_more = c > number
    @goods = @goods.limit(number)
  end

  def show
    @course = Currency.last.course
    @good = Collection.find(params[:id])

    @tiles = @good.tiles
  end
end
