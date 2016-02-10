class Factory < ActiveRecord::Base
  has_many :collections
  has_attached_file :logo, :styles => { :medium => "238x238>", :thumb => "100x100>" }
  validates_attachment_file_name :logo, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
