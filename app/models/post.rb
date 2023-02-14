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
  
  #def get_images(*size)
   # unless images.attached?
    #  file_path = Rails.root.join('app/assets/images/no-image.png')
     # images.attach(io: File.open(file_path), filename: 'no-image.png', content_type: 'image/png')
    #end
    
  #  if !size.empty?
   #   images.variant(resize: size)
  #  else
   #   image
  #  end
  #end
  
end
