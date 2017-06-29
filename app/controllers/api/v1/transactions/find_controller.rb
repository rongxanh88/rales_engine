class Api::V1::Transactions::FindController < ApplicationController
  def index
    @transactions = Transaction.where(search_params)
  end

  def show
    @transaction = Transaction.find_by(search_params)
  end

  private

  def search_params
    params.permit(:id, :credit_card_number, :result, :invoice_id, :created_at, :updated_at)
  end
end