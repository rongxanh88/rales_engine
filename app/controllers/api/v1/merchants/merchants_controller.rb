class Api::V1::Merchants::MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end
  
  def show
    render json: Merchant.find(params[:id].to_i)
  end
end