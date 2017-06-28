class Api::V1::Items::BusinessController < ApplicationController
  def show
    # most_revenue?quantity=x
    # returns the top x items ranked by total revenue generated
    top = Item.select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue").joins(:invoice_items).group("items.id").order("total_revenue DESC").limit(5)
    render json: top
  end

  def index
  end
end
