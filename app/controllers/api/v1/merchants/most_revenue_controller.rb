class Api::V1::Items::MostRevenueController < ApplicationController
  def index
    if params[:quantity]
      @revenue = Merchant.top_revenue(params[:quantity])
    else
      @revenue = Merchant.top_revenue
    end
  end
end
