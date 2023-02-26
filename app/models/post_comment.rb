class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :post
  
  validates :comment, presence: true
  validates :rate, presence: true
  
  # activestorageで複数の画像を投稿・保存する記述
  has_many_attached :images
  
  def get_images
    (images.attached?) ? images : 'no-image.png'
  end
  
end
