class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def index
    @invoice = Invoice.find(params[:invoice_id])
  end
end
