class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    date = DateTime.parse(params[:date])
    revenue = InvoiceItem.where(created_at: (date.beginning_of_day..date.end_of_day))
               .select("created_at::timestamp::date AS date, SUM(quantity*unit_price) AS revenue")
               .group("date")

    render json: revenue
  end

  def index
  end
end
