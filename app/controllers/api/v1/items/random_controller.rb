class Api::V1::Items::RandomController < ApplicationController
  def show
    id = Item.last.id
    begin
      item = Item.find(rand(1..id))
    rescue ActiveRecord::RecordNotFound
      retry
    end

    render json: item
  end
end
