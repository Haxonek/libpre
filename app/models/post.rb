class Post < ActiveRecord::Base
  has_many :post_items
  accepts_nested_attributes_for :post_items,
  															reject_if: :all_blank,
  															allow_destroy: true

  validates :title, :organization, :post_items, presence: true
  validates :title, :organization, length: {maximum: 255}
  validates :ip_address, length: {minimum: 7, maximum: 15}, allow_nil: true
end
