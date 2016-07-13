class Tag < ActiveRecord::Base
  has_and_belongs_to_many :collections

  validates :url, presence: true, uniqueness: true

  def get_title
  	[self.title, self.name, self.url].find{ |i| i.present? }
  end

  def get_description
  	[self.description, self.text].find{ |i| i.present? }
  end
end
