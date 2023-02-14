class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  # activestorageでプロフィール画像を保存する記述
  has_one_attached :profile_image
  
  #プロフィール画像がない場合のデフォルト画像設定
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no-image.png'
  end
  
end
