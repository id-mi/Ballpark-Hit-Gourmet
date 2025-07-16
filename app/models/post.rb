class Post < ApplicationRecord
  attachment :image 
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :place_category, optional: true
  belongs_to :genre_category, optional: true

  validates :place_category_id, presence: { message: "を選択してください"}
  validates :genre_category_id, presence: { message: "を選択してください"}
  validates :gourme_name, presence: { message: "を入力してください"}
  validates :shop_name, presence: { message: "を入力してください"}
  validates :price, presence: { message: "を入力してください"}
  validates :content, presence: { message: "を入力してください"}, length: { maximum: 150 }
  validates :image, presence: { message: "を選択してください"}

  enum status: { published: 0, draft: 1 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
