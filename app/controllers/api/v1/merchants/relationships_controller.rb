class Api::V1::Merchants::RelationshipsController < ApplicationController
  def index
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.items
  end

  def show
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.invoices
  end
end
