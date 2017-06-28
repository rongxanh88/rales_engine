class Api::V1::Merchants::CustomerController < ApplicationController

  def show
    # favorite_customer
    
  end

  def index
    #customers_with_pending_invoices
    binding.pry
    pending = Customer.joins(:invoices)
                      .where("invoices.merchant_id = ? AND invoices.status = ?",
                      params[:merchant_id], 'pending')
    render json: pending
  end

end
