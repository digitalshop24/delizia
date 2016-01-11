class Collection < ActiveRecord::Base
  belongs_to :factory
  has_many :tiles
  belongs_to :type
  belongs_to :zone
  belongs_to :material
  has_attached_file :image, :styles => { :medium => "238x238>", 
	                                     :thumb => "100x100>"
                                   }
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
