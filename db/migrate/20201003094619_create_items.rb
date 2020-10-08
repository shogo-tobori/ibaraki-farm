class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.text :explanation, null:false
      t.text :shipping_time, null:false
      t.string :image_id, null:false
      t.integer :genre_id, null:false

      t.timestamps
    end
  end
end
