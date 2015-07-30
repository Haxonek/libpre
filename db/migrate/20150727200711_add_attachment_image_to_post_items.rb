class AddAttachmentImageToPostItems < ActiveRecord::Migration
  def self.up
    change_table :post_items do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :post_items, :image
  end
end
