class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.integer :place_category_id
      t.integer :genre_id
      t.string :gourme_name
      t.string :shop_name
      t.string :price
      t.text :comment
      t.timestamps
    end
  end
end
