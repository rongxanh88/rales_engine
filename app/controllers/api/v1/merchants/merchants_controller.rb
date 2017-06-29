class Api::V1::Merchants::MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end
  
  def show
    @merchant = Merchant.find(params[:id].to_i)
  end
end