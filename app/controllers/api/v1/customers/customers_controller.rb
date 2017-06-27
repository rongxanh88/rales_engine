class Api::V1::Customers::CustomersController < ApplicationController
  def index
    render json: Customer.all
  end
  
  def show
    render json: Customer.find(params[:id].to_i)
  end
end