class Tag < ActiveRecord::Base
  has_and_belongs_to_many :collections

  validates :url, presence: true, uniqueness: true
end
