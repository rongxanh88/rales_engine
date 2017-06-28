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

  def self.revenue_for_merchant(merchant_id)
    Invoice.joins(:invoice_items, :transactions)
           .joins(:invoice_items)
           .where("invoices.merchant_id = ? AND transactions.result = 'success'", merchant_id)
           .select("SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue")
           .group(:merchant_id)
  end
end
