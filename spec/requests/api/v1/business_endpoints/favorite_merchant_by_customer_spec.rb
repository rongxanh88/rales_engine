require 'rails_helper'

RSpec.describe 'favorite merchant for customer', type: :request do
  context 'when the customer exists' do
    it 'returns total revenue' do
      customer = create(:customer)
      merchant = create(:merchant, name: "Saks and Raks")
      invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
      create(:transaction, invoice_id: invoice.id)

      5.times do
        create(:merchant)
      end

      get "/api/v1/customers/#{customer.id}/favorite_merchant.json"
      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result["name"]).to eq("Saks and Raks")
    end
  end

  context 'when no data exists' do

  end
end