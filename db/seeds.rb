# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 場所カテゴリの追加
place_categories = ["エスコンフィールドHOKKAIDO", "楽天モバイルパーク宮城", "ベルーナドーム", "東京ドーム", "明治神宮野球場", "ZOZOマリンスタジアム", "横浜スタジアム", "バンテリンドームナゴヤ", "京セラドーム大阪", "阪神甲子園球場", "MAZDA Zoom-Zoom", "みずほPayPayドーム福岡"]
place_categories.each do |name|
  PlaceCategory.find_or_create_by!(name: name)
end

# ジャンルカテゴリの追加
genre_categories = ["ご飯系", "麺系", "パン系", "おつまみ系", "スイーツ", "ドリンク(ソフトドリンク)", "ドリンク(アルコール)"]
genre_categories.each do |name|
  GenreCategory.find_or_create_by!(name: name)
end
