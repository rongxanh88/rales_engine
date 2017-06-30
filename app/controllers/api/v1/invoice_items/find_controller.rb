class Api::V1::InvoiceItems::FindController < ApplicationController
  def index
    if params["unit_price"]
      @invoice_items = InvoiceItem.where(unit_price: unit_price)
    else
      @invoice_items = InvoiceItem.where(search_params)
    end
  end

  def show
    if params["unit_price"]
      invoice_item = InvoiceItem.find_by(unit_price: unit_price)
    else
      invoice_item = InvoiceItem.find_by(search_params)
    end
    render json: invoice_item
  end

  private

  def search_params
    params.permit(:id, :item_id, :quantity, :invoice_id, :created_at, :updated_at)
  end

  def unit_price
    (((params["unit_price"].to_f)*100).to_i).to_s
  end
end
