class Post < ApplicationRecord

  belongs_to :user
  belongs_to :environment
  belongs_to :prefecture
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  validates :name, presence: true
  validates :body, presence: true, length: { maximum: 500 }
  validates :address, presence: true
  validates :longitude, presence: true, length: { minimum: 5, maximum: 21 }
  validates :latitude, presence: true, length: { minimum: 5, maximum: 21 }
  validates :access, presence: true, length: { maximum: 200 }
  validates :facility, presence: true, length: { maximum: 50 }
  validates :contact, presence: true, length: { maximum: 50 }
  validates :rate, presence: true
  
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
