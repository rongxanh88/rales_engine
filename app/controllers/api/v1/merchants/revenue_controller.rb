class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    date = DateTime.parse(params[:date])
    render json: Merchant.revenue_on_date(date)
  end

  def show
    if params[:date]
      revenue = Merchant.revenue_for_merchant_by_date(params[:merchant_id], params[:date])
    else
      revenue = Merchant.revenue_for_merchant(params[:merchant_id])
    end
    render json: revenue
  end
end