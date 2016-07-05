class Collection < ActiveRecord::Base
  PER_PAGE = 15
  # default_scope { order('collections.created_at DESC') }
  belongs_to :factory
  has_many :tiles
  has_and_belongs_to_many :types
  has_and_belongs_to_many :zones
  has_and_belongs_to_many :materials
  has_and_belongs_to_many :tags

  belongs_to :image
  include Galleryable
  has_one :gallery, as: :galleryable, dependent: :destroy
  has_attached_file :image,
    styles: { thumb: "200x200>", catalog: '350x250>', medium: "500x500>", big: "1000x1000>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  after_save :set_preview

  def set_preview
    unless image_file_name
      images.first.as_preview(self) if (images && images.first)
    end
  end
end
