class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :invoices
  has_many :items

  def self.revenue_on_date(date)
    Invoice.joins(:invoice_items)
           .where(created_at: date)
           .select("invoices.created_at::timestamp::date AS date, SUM(invoice_items.quantity*invoice_items.unit_price) AS total_revenue")
           .group("date")
  end
end
