class Api::V1::Items::MostRevenueController < ApplicationController
  def index
    revenue = Item.most_revenue(params[:quantity])
    render json: revenue
  end
end
