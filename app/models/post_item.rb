class PostItem < ActiveRecord::Base
  belongs_to :post

  validates :image_title, length: {maximum: 255}
  validates :description, length: {maximum: 65534}
end
