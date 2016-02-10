class PagesController < ApplicationController
  def about
    @news = News.recent
    @page = Page.find_by_key('about')
  end
  def contacts
    @entry = Entry.new
  end
  def delivery
    @page = Page.find_by_key('delivery')
    render :page
  end
  def dealers
    @page = Page.find_by_key('dealers')
    render :page
  end
end
