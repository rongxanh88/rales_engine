class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    @revenue = Merchant.top_revenue(params[:quantity])
  end
end
