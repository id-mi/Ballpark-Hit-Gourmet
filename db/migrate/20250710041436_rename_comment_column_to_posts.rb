class RenameCommentColumnToPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :comment, :content
  end
end
