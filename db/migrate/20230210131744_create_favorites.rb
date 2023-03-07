class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|

      ## 中間テーブルとしての紐付け用会員id
      t.integer :user_id, null: false
      ## 中間テーブルとしての紐付け用投稿id
      t.integer :post_id, null: false
      
      t.timestamps null: false
    end
  end
end
