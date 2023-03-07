class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefectures do |t|

      ## 県名用カラム
      t.string :name, null: false
      
      t.timestamps null: false
    end
  end
end
