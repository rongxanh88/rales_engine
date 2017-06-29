class Api::V1::Items::BusinessController < ApplicationController
  def show
    if params[:quantity]
      @revenue = Item.most_revenue(params[:quantity])
    else
      @revenue = Item.most_revenue
    end
  end
end
