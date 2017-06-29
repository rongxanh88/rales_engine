class Api::V1::Merchants::CustomerController < ApplicationController

  def show
    # favorite_customer
    # returns the customer who has conducted the most total number of successful transactions
    Customer.joins(:transactions, :invoices).where(transactions: {result: "success"})

  end

  def index
    #customers_with_pending_invoices
    pending = Customer.joins(:invoices).where("invoices.merchant_id = ? AND invoices.status = ?", params[:merchant_id], 'pending')
    render json: pending
  end
end
