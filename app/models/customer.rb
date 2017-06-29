class Customer < ApplicationRecord
  validates :first_name, :last_name, presence: true

  has_many :invoices

  def self.favorite_merchant(customer_id)
    Merchant.joins(
      "INNER JOIN (" +
      Invoice.joins(:transactions)
              .where(invoices: {customer_id: customer_id}, transactions: {result: 'success'})
              .select("invoices.merchant_id, COUNT(invoices.merchant_id) AS frequency")
              .group("invoices.merchant_id")
              .order("frequency DESC")
              .limit(1).to_sql +
      ") invoice_transactions ON merchants.id = invoice_transactions.merchant_id"
    )
  end

  def self.favorite_customer(merchant_id)
    Customer.joins("INNER JOIN (" +
      Invoice.joins(:transactions)
              .where(transactions: {result: "success"}, invoices: {merchant_id: merchant_id})
              .select("invoices.customer_id, count(invoices.customer_id) AS frequency")
              .group("invoices.customer_id")
              .order("frequency DESC")
              .limit(1).to_sql +
      ") invoice_transactions ON customers.id = invoice_transactions.customer_id").first
  end
end
