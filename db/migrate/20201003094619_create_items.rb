class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.text :shipping_time
      t.string :image_id

      t.timestamps
    end
  end
end
