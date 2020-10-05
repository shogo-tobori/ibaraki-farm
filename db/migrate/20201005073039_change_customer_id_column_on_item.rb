class ChangeCustomerIdColumnOnItem < ActiveRecord::Migration[5.2]
  def up
    change_column_null :items, :customer_id, false, 0
    change_column :items, :customer_id, :integer, default: 0
  end

  def down
    change_column_null :items, :customer_id, true, nil
    change_column :items, :customer_id, :integer, default: nil
  end
end
