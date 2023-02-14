class Post < ApplicationRecord

  belongs_to :user
  belongs_to :environment
  belongs_to :prefecture
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  # activestorageで複数の画像を投稿・保存する記述
  has_many_attached :images
  
end
