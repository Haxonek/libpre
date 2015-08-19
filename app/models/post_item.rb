class PostItem < ActiveRecord::Base
  belongs_to :post

  validates  :image_title, length: {maximum: 255}
  validates  :description, length: {maximum: 65534}

  has_attached_file :image, # Maybe comment out compression to see if that's the problem?
                    :styles => {thumbnail: "300x300#", original: ""},
                    processors: [:thumbnail, :compression]

  validates :image,
            attachment_content_type: { :content_type => ["image/jpeg", "image/png"] },
            attachment_size: { less_than: 6.megabytes }

  # validates_attachment :image, :content_type => { :content_type => ["image/jpeg", "image/png"] }
  # validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 4.megabytes
end
