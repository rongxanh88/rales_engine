class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.text :status
      t.references :merchant, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true

      t.timestamps
    end
  end
end
