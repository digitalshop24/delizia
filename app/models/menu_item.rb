class MenuItem < ActiveRecord::Base
  default_scope { order priority: :desc }

  belongs_to :parent, class_name: 'MenuItem', foreign_key: :parent_id
  has_many :children, class_name: 'MenuItem', foreign_key: :parent_id, dependent: :nullify

  validates_presence_of :text, :url

  def self.root
    where(parent: nil)
  end
end
