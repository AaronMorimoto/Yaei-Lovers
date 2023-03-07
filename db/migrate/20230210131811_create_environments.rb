class CreateEnvironments < ActiveRecord::Migration[6.1]
  def change
    create_table :environments do |t|

      ## 環境名用カラム
      t.string :name, null: false
      
      t.timestamps null: false
    end
  end
end
