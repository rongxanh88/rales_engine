class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    date = DateTime.parse(params[:date])
    render json: Merchant.revenue_on_date(date)
  end

  def show
    binding.pry
  end
end