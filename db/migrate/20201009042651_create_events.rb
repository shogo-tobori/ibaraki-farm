class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :explanation, null: false
      t.date :start, null: false
      t.date :end, null: false

      t.timestamps
    end
  end
end
