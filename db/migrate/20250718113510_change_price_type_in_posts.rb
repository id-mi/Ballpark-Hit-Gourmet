class ChangePriceTypeInPosts < ActiveRecord::Migration[7.1]
  def change
    change_column :posts, :price, :integer
  end
end
