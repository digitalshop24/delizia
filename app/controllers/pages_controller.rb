class PagesController < ApplicationController
  def update
    page = Page.find(params[:id])
    page.update(page_params)
    redirect_to :back
  end
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

  private
  def page_params
    params[:page].permit(:title, :description, :top_text, :bottom_text, :keywords)
  end
end
