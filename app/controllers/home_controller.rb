class HomeController < ApplicationController
  def index
    @news = News.recent
    @entry = Entry.new
    @collections = Collection.where(home_page: true).limit(3)
    @slider_images = Slider.order(priority: :desc)
    # @collections = Collection.where(new: 'true').limit(3).order("RANDOM()")
  end
  def stat
    response = HTTParty.get('http://www.redbullcanyoumakeit.com/applications/list.json?region_id=2&order=votes_desc')
    json = JSON.parse(response.body)
    hash = {}
    res = response["data"]["applications"].map{|s| hash[s['id']] = s['fblikes']}
    place = hash.to_a.map(&:first).index(6766)+1
    fblikes = hash[6766]
    str=''
    5.times do |i|
      a = hash.to_a[i][1]
      str += "#{a-fblikes} "
    end
    render text: str
  end
end
