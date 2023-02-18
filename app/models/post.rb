class Post < ApplicationRecord

  belongs_to :user
  belongs_to :environment
  belongs_to :prefecture
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  # activestorageで複数の画像を投稿・保存する記述
  has_many_attached :images
  
  
  def get_images
    (images.attached?) ? images : 'no-image.png'
  end
  
  #Favoritesテーブル内にuser_idが存在するか確認
  def favorited_by?(user_id)
    favorites.exists?(user_id: user_id)
  end
  
end
