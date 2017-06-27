class Api::V1::Customers::FindController < ApplicationController
  def index
    render json: Customer.where(search_params)
  end

  def show
    render json: Customer.find_by(search_params)
  end

  private

  def search_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end