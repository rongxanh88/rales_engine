class ChangeColumnUnitPrice < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoice_items, :unit_price, :integer
    add_column    :invoice_items, :unit_price, :text
    remove_column :items, :unit_price, :integer
    add_column    :items, :unit_price, :text
  end
end
