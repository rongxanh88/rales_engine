class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    @items = Merchant.most_items_sold(params[:quantity])
  end
end
