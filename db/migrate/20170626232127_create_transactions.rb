class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.bigint :credit_card_number
      t.text   :result

      t.timestamps
    end
  end
end
