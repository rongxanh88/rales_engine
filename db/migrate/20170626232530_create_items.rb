class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :name
      t.text :description
      t.bigint  :unit_price
      t.references :merchants, index: true, foreign_key: true

      t.timestamps
    end
  end
end
