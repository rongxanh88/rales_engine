class Api::V1::Transactions::TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end
  
  def show
    @transaction = Transaction.find(params[:id].to_i)
  end
end