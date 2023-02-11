class Environment < ApplicationRecord
  
  has_many :posts, dependent: :destroy
  
end
