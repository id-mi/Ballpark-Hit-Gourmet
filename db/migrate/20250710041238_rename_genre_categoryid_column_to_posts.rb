class RenameGenreCategoryidColumnToPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :genre_categoryid, :genre_category_id
  end
end
