class Tile < ActiveRecord::Base
  belongs_to :collection
  belongs_to :surface
  has_attached_file :image, :styles => { :medium => "238x238>", 
	                                     :thumb => "100x100>"
                                   }
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
