class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def set_admin_locale
	    I18n.locale = :ru
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
