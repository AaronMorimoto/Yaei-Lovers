class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|

      ## 中間テーブルとしての紐付け用会員id
      t.integer :user_id, null: false
      ## 中間テーブルとしての紐付け用投稿id
      t.integer :post_id, null: false
      ## コメント用カラム
      t.text :comment, null: false
      ## レビュー用カラム
      t.float :rate, null: false
      
      t.timestamps null: false
    end
  end
end
