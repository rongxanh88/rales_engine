class Api::V1::Customers::RelationshipController < ApplicationController
  def show
    customer = Customer.find(params[:customer_id])
    render json: customer.invoices
  end

  def index
    customer = Customer.find(params[:customer_id])
    render json: customer.transactions
  end
end
