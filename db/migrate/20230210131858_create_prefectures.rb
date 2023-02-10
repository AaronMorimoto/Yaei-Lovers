class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefectures do |t|

      ## 県名用カラム
      t.string :name, null: false
      ## 会員の登録・更新日時がデフォルトでnowになるように設定しています。
      t.timestamps null: false, default: ->{ "CURRENT_TIMESTAMP" }
    end
  end
end
