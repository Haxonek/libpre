class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.datetime :viewed_at, null: false
      t.string :organization, null: false
      t.string :ip_address
      t.references :post, index: true, foreign_key: true
    end
  end
end
