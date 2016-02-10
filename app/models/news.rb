class News < ActiveRecord::Base
	include Galleryable
  has_one :gallery, as: :galleryable, dependent: :destroy
	has_attached_file :image,
		    styles: { thumb: "200x200>", medium: "300x300>" }
	  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	def self.recent number=3
		order(created_at: :desc).limit(number)
	end
end
