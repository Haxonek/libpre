class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :tags
      t.string :organization
      t.integer :hits, null: false, default: 0
      t.boolean :nsfw
      t.string :ip_address

      t.timestamps null: false
    end
    add_index :posts, :ip_address
  end
end
