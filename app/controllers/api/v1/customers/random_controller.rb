class Api::V1::Customers::RandomController < ApplicationController
  def show
    id = Customer.last.id
    begin
      @customer = Customer.find(rand(1..id))
    rescue ActiveRecord::RecordNotFound
      retry
    end
  end
end