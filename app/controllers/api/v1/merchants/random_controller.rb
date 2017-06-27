class Api::V1::Merchants::RandomController < ApplicationController
  def show
    id = Merchant.last.id
    begin
      merchant = Merchant.find(rand(1..id))
    rescue ActiveRecord::RecordNotFound
      retry
    end

    render json: merchant
  end
end