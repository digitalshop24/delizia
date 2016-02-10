class Slider < ActiveRecord::Base
		has_attached_file :image,
		    styles: { preview: "500x150", slider: "1500x450" }
	  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
