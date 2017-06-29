class Api::V1::InvoiceItems::ItemsController < ApplicationController
  def show
    @invoice_item = InvoiceItem.find(params[:invoice_item_id])
  end

end
