class Api::V1::Invoices::FindController < ApplicationController
  def index
    @invoices = Invoice.where(search_params)
  end

  def show
    @invoice = Invoice.find_by(search_params)
  end

  private

  def search_params
    params.permit(:id, :status, :merchant_id, :customer_id, :created_at, :updated_at)
  end
end
