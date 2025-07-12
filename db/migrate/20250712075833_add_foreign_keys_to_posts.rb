class AddForeignKeysToPosts < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :posts, :place_categories
    add_foreign_key :posts, :genre_categories 

    add_index :posts, :place_category_id
    add_index :posts, :genre_category_id
  end
end
