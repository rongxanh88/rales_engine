class Api::V1::InvoiceItems::FindController < ApplicationController
  def index
    @invoice_items = InvoiceItem.where(search_params)
  end

  def show
    @invoice_item = InvoiceItem.find_by(search_params)
  end

  private

  def search_params
    params.permit(:id, :item_id, :quantity, :unit_price, :invoice_id, :created_at, :updated_at)
  end
end
