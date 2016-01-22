class Tile < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  belongs_to :collection
  belongs_to :surface
  belongs_to :amount
  has_attached_file :image, :styles => { :medium => "238x238>", 
	                                     :thumb => "100x100>"
                                   }
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
