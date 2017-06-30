class AddRefTransactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :invoice, index: true, foreign_key: true
  end
end
