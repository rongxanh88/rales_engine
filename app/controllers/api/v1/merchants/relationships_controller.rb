class Api::V1::Merchants::RelationshipsController < ApplicationController
  def index
    @merchant = Merchant.find(params["merchant_id"])
  end

  def show
    @merchant = Merchant.find(params["merchant_id"])
  end
end
