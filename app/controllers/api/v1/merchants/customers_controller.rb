class Api::V1::Merchants::CustomersController < ApplicationController

  def show
    customer = Customer.favorite_customer(params[:merchant_id])
    render json: customer
  end

  def index
    #customers_with_pending_invoices
    pending = Customer.joins(:invoices).where("invoices.merchant_id = ? AND invoices.status = ?", params[:merchant_id], 'pending')
    render json: pending
  end
end
