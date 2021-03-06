class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|
      t.bigint     :quantity
      t.bigint     :unit_price
      t.references :item, index: true, foreign_key: true
      t.references :invoice, index: true, foreign_key: true

      t.timestamps
    end
  end
end
