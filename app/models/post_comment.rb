class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :post
  
  # activestorageで複数の画像を投稿・保存する記述
  has_many_attached :post_comment_images
end
