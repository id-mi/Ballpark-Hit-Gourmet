class Post < ApplicationRecord
  attachment :image 
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :place_category
  belongs_to :genre_category  


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
