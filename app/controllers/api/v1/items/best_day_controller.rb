class Api::V1::Items::BestDayController < ApplicationController
  def show
    @best_day = Item.best_day(params[:item_id]).first
  end
end
