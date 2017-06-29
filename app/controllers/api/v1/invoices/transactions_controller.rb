class Api::V1::Invoices::TransactionsController < ApplicationController
  def index
    @invoice = Invoice.include_transactions(params[:invoice_id])
  end
end
