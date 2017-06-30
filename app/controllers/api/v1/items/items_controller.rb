class Api::V1::Items::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @item.unit_price = @item.unit_price.to_f/100
  end
end