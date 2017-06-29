class Api::V1::Merchants::CustomersController < ApplicationController

  def show
    customer = Customer.favorite_customer(params[:merchant_id])
    render json: customer
  end

  def index
    customer = Customer.pending_invoices(params[:merchant_id])
    render json: customer
  end
end
