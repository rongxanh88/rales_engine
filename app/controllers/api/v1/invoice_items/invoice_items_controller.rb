class Api::V1::InvoiceItems::InvoiceItemsController < ApplicationController
  def index
    @invoice_items = InvoiceItem.all
  end

  def show
    @invoice_item = InvoiceItem.find(params[:id])
    @invoice_item.unit_price = @invoice_item.unit_price.to_f/100
  end
end
