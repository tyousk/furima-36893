class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,           null: false
      t.text :about,           null: false
      t.integer :category_id,           null: false
      t.integer :statues_id,           null: false
      t.integer :fee_id,           null: false
      t.integer :prefecture_id,           null: false
      t.integer :send_day_id,           null: false
      t.integer :price,           null: false
      t.references :user,         null: false, foreign: true
      t.timestamps
    end
  end
end
