class Api::V1::Invoices::MerchantsController < ApplicationController
  def show
    @invoice = Invoice.find(params[:invoice_id])
  end
end
