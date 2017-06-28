require 'rails_helper'

RSpec.describe 'favorite merchant for customer', type: :request do
  context 'when the customer exists' do
    it 'returns total revenue' do
      # merchant = create(:merchant, name: "Saks and Raks")
      # invoice = create(:invoice, merchant_id: merchant.id)
      # create(:transaction, invoice_id: invoice.id)
      # create(:invoice_item, quantity: 50, invoice_id: invoice.id)

      # 5.times do
      #   create(:merchant)
      # end
      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}/favorite_merchant"
      result = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      # binding.pry
    end
  end

  context 'when no data exists' do

  end
end