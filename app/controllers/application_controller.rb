class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def set_admin_locale
    I18n.locale = :ru
  end

  def render *args
    unless controller_path.split('/').first == 'admin'
      set_metas
      positions = MenuItem.pluck(:position).uniq
      @menu_items = {}
      positions.each do |pos|
        @menu_items[pos] = MenuItem.root.where(position: pos)
      end
    end
    super
  end

  def set_metas
    path = request.path[1..-1]
    path += "?#{request.query_string}" if request.query_string.present?
    @page = Page.where(key: path).first_or_create
    @title = meta :title
    @description = meta :description
    @keywords = meta :keywords
  end

  def meta name
    name = name.to_sym
    arr = []
    arr << @page.send(name) if @page.respond_to?(name)
    obj = @good || @news || @tag
    meth = "get_#{name}".to_sym
    arr << obj.send(meth) if obj && obj.respond_to?(meth)
    arr.find{ |i| i.present? }
  end

  def set_all
    @factories = Factory.all
    @zones = Zone.all
    @types = Type.all
    @sizes = FilterSize.all.order(priority: :desc)
    @prices = [
      ['1_000_000-2_000_000', 'от 1 млн до 2 млн'],
      ['2_000_000-3_000_000', 'от 2 млн до 3 млн'],
      ['3_000_000-9_999_999_999', 'от 3 млн и более'],
      ['0-9_999_999_999', 'любая']
    ]
  end
end
