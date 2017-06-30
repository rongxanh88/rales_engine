class Api::V1::Customers::RelationshipController < ApplicationController
  def show
    @customer = Customer.find(params["customer_id"])
  end

  def index
    @customer = Customer.find(params["customer_id"])
  end
end
