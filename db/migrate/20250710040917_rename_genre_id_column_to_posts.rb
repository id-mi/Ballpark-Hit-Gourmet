class RenameGenreIdColumnToPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :genre_id, :genre_categoryid
  end
end
