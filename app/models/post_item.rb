class PostItem < ActiveRecord::Base
  belongs_to :post

  validates :image_title, length: {maximum: 255}
  validates :description, length: {maximum: 65534}

  has_attached_file :image, styles: {full: '3000x3000>'},
                    processors: [:thumbnail, :compression]
  validates_attachment :image, :content_type => { :content_type => ["image/jpeg", "image/png"] }
  validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 12.megabytes
end
