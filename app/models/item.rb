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

  def self.most_popular_items(quantity)
    Item.joins(
      "INNER JOIN (" +
      Invoice.joins(:invoice_items, :transactions)
             .where(transactions: {result: 'success'})
             .select("SUM(invoice_items.quantity) AS total_sold, invoice_items.item_id")
             .group("item_id")
             .order("total_sold DESC")
             .limit(quantity).to_sql +
      ") items_sold ON items_sold.item_id = items.id"
    )
  end

  def self.most_revenue(quantity = 5)
    Item.select("items.*, sum(invoice_items.quantity * invoice_items.unit_price)/100 AS total_revenue")
        .joins(:invoice_items)
        .group("items.id")
        .order("total_revenue DESC")
        .limit(quantity)
  end
end
