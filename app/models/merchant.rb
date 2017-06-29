class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :invoices
  has_many :items

  def self.revenue_on_date(date)
    Invoice.joins(:invoice_items, :transactions)
           .where(invoices: {created_at: date}, transactions: {result: 'success'})
           .select("invoices.created_at::timestamp::date AS date, SUM(invoice_items.quantity*invoice_items.unit_price::numeric)/100 AS total_revenue")
           .group("date")
  end

  def self.revenue_for_merchant(merchant_id)
    Invoice.joins(:invoice_items, :transactions)
           .joins(:invoice_items)
           .where("invoices.merchant_id = ? AND transactions.result = 'success'", merchant_id)
           .select("SUM(invoice_items.quantity*invoice_items.unit_price::numeric)/100 AS revenue")
           .group(:merchant_id)
  end

  def self.revenue_for_merchant_by_date(merchant_id, date)
    Invoice.joins(:invoice_items, :transactions)
           .joins(:invoice_items)
           .where("invoices.merchant_id = ? AND transactions.result = 'success' AND invoices.created_at = ?", merchant_id, date)
           .select("SUM(invoice_items.quantity*invoice_items.unit_price::numeric)/100 AS revenue")
           .group(:merchant_id)
  end

  def self.most_items_sold(quantity = 5)
    Merchant.joins(
      "INNER JOIN (" +
      Invoice.joins(:invoice_items, :transactions)
             .where("transactions.result = 'success'")
             .select("SUM(invoice_items.quantity) AS items_sold, invoices.merchant_id")
             .group("invoices.merchant_id")
             .order("items_sold DESC")
             .limit(quantity).to_sql +
      ") invoices ON merchants.id = invoices.merchant_id"
    ).order("invoices.items_sold DESC")
  end

  def self.top_revenue(quantity = 1)
    Merchant.joins(
      "INNER JOIN (" +
      Invoice.joins(:transactions, :invoice_items).where(transactions: {result: 'success'})
      .select("invoices.merchant_id, sum(invoice_items.quantity*invoice_items.unit_price::numeric)/100 AS total_revenue")
      .group("invoices.merchant_id")
      .order("total_revenue DESC")
      .limit(quantity)
      .to_sql +
      ") merchant_revenues ON merchant_revenues.merchant_id = merchants.id")
      .select("merchant_revenues.total_revenue, merchants.*")
  end
end