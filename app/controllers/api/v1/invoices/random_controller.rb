class Api::V1::Invoices::RandomController < ApplicationController
  def show
    id = Invoice.last.id
    begin
      invoice = Invoice.find(rand(1..id))
    rescue ActiveRecord::RecordNotFound
      retry
    end

    render json: invoice
  end
end
