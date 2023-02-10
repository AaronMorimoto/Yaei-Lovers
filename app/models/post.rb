class Post < ApplicationRecord

  # activestorageで複数の画像を投稿・保存する記述
  has_many_attached :post_images
end
