class Api::V1::Transactions::RandomController < ApplicationController
  def show
    id = Transaction.last.id
    begin
      transaction = Transaction.find(rand(1..id))
    rescue ActiveRecord::RecordNotFound
      retry
    end

    render json: transaction
  end
end