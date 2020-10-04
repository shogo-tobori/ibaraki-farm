class AddSaleStatusToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :sale_status, :boolean, default: true, null: false
  end
end
