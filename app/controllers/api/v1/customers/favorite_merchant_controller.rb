class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  def show
    @merchant = Customer.favorite_merchant(params[:customer_id]).first
  end
end