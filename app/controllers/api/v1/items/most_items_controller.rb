class Api::V1::Items::MostItemsController < ApplicationController
  def index
    @popular = Item.most_popular_items(params[:quantity])
  end
end
