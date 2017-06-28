class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates :name, :description, :unit_price, :merchant_id, presence: true

  def self.best_day(item_id)
    Invoice.joins(:invoice_items, :transactions)
           .where(transactions: {result: 'success'}, invoice_items: {item_id: item_id})
           .select("SUM(invoice_items.quantity) AS items_sold, invoices.created_at AS best_day")
           .group("best_day")
           .order("items_sold DESC, best_day DESC")
           .limit(1)
  end
end
