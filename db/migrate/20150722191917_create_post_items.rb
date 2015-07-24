class CreatePostItems < ActiveRecord::Migration
  def change
    create_table :post_items do |t|
      t.string :image_title
      t.text :description
      t.belongs_to :post, index: true #, foreign_key: true
    end
  end
end
