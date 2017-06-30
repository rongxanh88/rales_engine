class Api::V1::Items::FindController < ApplicationController
  def index
    if params["unit_price"]
      @items = Item.where(unit_price: unit_price)
    else
      @items = Item.where(search_params)
    end
  end

  def show
    if params["unit_price"]
      @item = Item.find_by(unit_price: unit_price)
    else
      @item = Item.find_by(search_params)
    end
  end

  private

  def search_params
    params.permit(:id, :name, :description, :merchant_id, :created_at, :updated_at)
  end

  def unit_price
    (((params["unit_price"].to_f)*100.001).to_i).to_s
  end
end
