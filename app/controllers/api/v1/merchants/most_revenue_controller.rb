class Api::V1::Items::MostRevenueController < ApplicationController
  def index
    # most_revenue?quantity=x
    # returns the top x merchants ranked by total revenue
    Merchant.joins(
      "INNER JOIN (" +
      Invoice.joins(:transactions, :invoice_items).where(transactions: {result: 'success'})
      .select("invoices.merchant_id, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
      .group("invoices.merchant_id")
      .order("total_revenue DESC")
      .limit(5)
      .to_sql +
      ") merchant_revenues ON merchant_revenues.merchant_id = merchants.id")
      .select("merchant_revenues.total_revenue, merchants.*")
  end
end
