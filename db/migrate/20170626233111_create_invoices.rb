class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.text :status
      t.references :merchants, index: true, foreign_key: true
      t.references :customers, index: true, foreign_key: true

      t.timestamps
    end
  end
end
