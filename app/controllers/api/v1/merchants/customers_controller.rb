class Api::V1::Merchants::CustomersController < ApplicationController

  def show
    render json: Customer.favorite_customer(params[:merchant_id])
  end

  def index
    render json: Customer.pending_invoices(params[:merchant_id])
  end
end
