class Page < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "200x200>", big: "1000x1000>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  def self.about
    Page.find_by_key('about')
  end
  def self.delivery
    Page.find_by_key('delivery')
  end
  def self.dealers
    Page.find_by_key('dealers')
  end
end
