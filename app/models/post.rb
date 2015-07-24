class Post < ActiveRecord::Base
  has_many :post_items
  accepts_nested_attributes_for :post_items,
  															reject_if: proc { |attributes| attributes['description'].blank? },
  															allow_destroy: true
  validates :title, :organization, :post_items, presence: true
  validates :title, :organization, length: {maximum: 255}
end
