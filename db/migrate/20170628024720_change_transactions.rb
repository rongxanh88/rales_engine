class ChangeTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :credit_card_number, :integer
    add_column    :transactions, :credit_card_number, :text
  end
end
