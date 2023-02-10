class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      ## userモデルとの紐付け用 会員１対 投稿多
      t.integer :user_id, null: false
      ## environmentモデルとの紐付け用 環境１対 投稿多
      t.integer :environment_id, null: false
      ## prefectureモデルとの紐付け用 県１対 投稿多
      t.integer :prefecture_id, null: false
      ## 野営地名用カラム
      t.string :name, null: false
      ## 本文（説明文）用カラム
      t.text :body, null: false
      ## 住所用カラム
      t.string :address, null: false
      ## 郵便番号用カラム
      t.string :postal_code, null: false
      ## 座標用カラム
      t.string :coordinate, null: false
      ## アクセス方法用カラム
      t.text :access, null: false
      ## 設備用カラム
      t.string :facility, null: false
      ## 許可確認先用カラム
      t.string :contact, null: false
      ## レビュー用カラム
      t.float :rate, null: false
      ## 会員の登録・更新日時がデフォルトでnowになるように設定しています。
      t.timestamps null: false, default: ->{ "CURRENT_TIMESTAMP" }
    end
  end
end
