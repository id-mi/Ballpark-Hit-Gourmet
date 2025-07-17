class Post < ApplicationRecord
  attachment :image 
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :place_category, optional: true
  belongs_to :genre_category, optional: true

  validates :place_category_id, presence: true
  validates :genre_category_id, presence: true
  validates :gourme_name, presence: true
  validates :shop_name, presence: true
  validates :price, presence: true
  validates :content, presence: true, length: { maximum: 150 }
  validates :image, presence: true

  enum status: { published: 0, draft: 1 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
