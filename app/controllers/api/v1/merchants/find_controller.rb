class Api::V1::Merchants::FindController < ApplicationController
  def index
    @merchants =  Merchant.where(search_params)
  end

  def show
    @merchant =  Merchant.find_by(search_params)
  end

  private

  def search_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
