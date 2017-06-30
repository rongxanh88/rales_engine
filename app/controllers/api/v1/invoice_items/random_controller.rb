class Api::V1::InvoiceItems::RandomController < ApplicationController
  def show
    id = InvoiceItem.last.id
    begin
      @invoice_item = InvoiceItem.find(rand(1..id))
    rescue ActiveRecord::RecordNotFound
      retry
    end
  end
end
