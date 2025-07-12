class ChangePostCategoryIdsToReferences < ActiveRecord::Migration[7.1]
  def change
    # Remove existing integer columns
    remove_column :posts, :place_category_id, :integer
    remove_column :posts, :genre_category_id, :integer
    
    # Add reference columns (allow null initially to handle existing data)
    add_reference :posts, :place_category, null: true, foreign_key: true
    add_reference :posts, :genre_category, null: true, foreign_key: true
  end
end
