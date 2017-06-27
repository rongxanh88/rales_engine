class Api::V1::InvoiceItems::InvoiceItemsController < ApplicationController
  def index
    render json: Invoice_Item.all
  end

  def show
    render json: Invoice_Item.find(params[:id])
  end
end
