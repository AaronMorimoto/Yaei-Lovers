class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  # activestorageでプロフィール画像を保存する記述
  has_one_attached :profile_image
  
  #プロフィール画像がない場合のデフォルト画像設定
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no-image.png'
  end
  
  #このselfはUserクラスを引っ張っています。
  def self.guest
    #find_byではなく，find_or_create_byを利用している理由は、万が一ゲストユーザーを削除された場合にゲスト機能が動作しなくなるリスク回避用です。
    find_or_create_by!(email: 'guest@example.com') do |user|
      #パスワードを特定され、メールアドレス・パスワードを変更されるリスク回避用に，パスワードはランダム文字列にしています。
      user.password = SecureRandom.alphanumeric(12)
      #nameが入力必須な為、設定
      user.name = "ゲスト"
    end
  end
  
end
